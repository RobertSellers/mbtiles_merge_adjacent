print("Running merge_multi.py")

import os, sys, sqlite3, cStringIO, StringIO, subprocess, pandas
from PIL import Image

mb_a =  sys.argv[1]
mb_b =  sys.argv[2]

basename_a = os.path.splitext(os.path.basename(mb_a))[0]
basename_b = os.path.splitext(os.path.basename(mb_b))[0]

subprocess.call ("Rscript adjacencies.R "+mb_a+ " " + mb_b, shell=True)
xyzs = pandas.read_csv('temp_adj.csv')

class MbtileSet:

    def __init__(self, mbtiles, outdir=None, origin="bottom"):
        self.conn = sqlite3.connect(mbtiles)
        self.outdir = outdir
        self.origin = origin
        if self.origin not in ['bottom','top']:
            raise Exception("origin must be either `bottom` or `top`")

    def get_tile(self, z, x, y):
        return Mbtile(z, x, y, self.conn, self.origin)


class Mbtile:

    def __init__(self, z, x, y, conn, origin):
        self.zoom = z
        self.col = x
        self.row = y
        self.conn = conn
        self.origin = origin
        self.blank_png_path = r"C:\Users\rober\Desktop\AWS_Tilemill\python\png\blank.png"
    def get_png(self):
        c = self.conn.cursor()
        c.execute('''select tile_data from tiles 
                      where zoom_level = %s 
                      and tile_column = %s 
                      and tile_row = %s''' % (self.zoom,self.col,self.row))
        row = c.fetchone()
        if not row:
            return None

        return row[0]


print("Connecting to SQLlite")
tileset_a = MbtileSet(mbtiles=mb_a)
tileset_b = MbtileSet(mbtiles=mb_b)
print(tileset_a)
print(tileset_b)
print("Connecting to SQLlite Success")

for index, row in xyzs.iterrows():
	t_zoom, t_col, t_row = int(row['zoom_level']), int(row['tile_column']), int(row['tile_row'])
	tile_a = tileset_a.get_tile(t_zoom, t_col, t_row)
	tile_b = tileset_b.get_tile(t_zoom, t_col, t_row)
	raw_a = tile_a.get_png()
	raw_b = tile_b.get_png()
	raw_a_tobytes = bytes(raw_a)
	raw_b_tobytes = bytes(raw_b)
	cstring_a = cStringIO.StringIO(raw_a_tobytes)
	cstring_b = cStringIO.StringIO(raw_b_tobytes)
	rawpng_2RGB_a = Image.open(cstring_a).convert("RGBA")
	rawpng_2RGB_b = Image.open(cstring_b).convert("RGBA")
	width_a, height_a = rawpng_2RGB_a.size
	datas_a = rawpng_2RGB_a.load()
	for y in xrange(height_a):
		for x in xrange(width_a):
			if datas_a[x, y] == (204, 221, 221, 255):
				datas_a[x, y] = (204, 221, 221, 0)
	width_b, height_b = rawpng_2RGB_b.size
	datas_b = rawpng_2RGB_b.load()
	for y in xrange(height_b):
		for x in xrange(width_b):
			if datas_b[x, y] == (204, 221, 221, 255):
				datas_b[x, y] = (204, 221, 221, 0)
	merged_two = rawpng_2RGB_b
	merged_two.paste(rawpng_2RGB_a, (0, 0), rawpng_2RGB_a)
	
	cursor_a = tileset_a.conn.cursor()
	cursor_a.execute('''select tile_id from map 
				  where zoom_level = %s 
				  and tile_column = %s 
				  and tile_row = %s''' % (t_zoom,t_col,t_row))
	row_a = cursor_a.fetchone()
	tile_id_a = ''.join(row_a)
	
	cursor_b = tileset_b.conn.cursor()
	cursor_b.execute('''select tile_id from map 
				  where zoom_level = %s 
				  and tile_column = %s 
				  and tile_row = %s''' % (t_zoom,t_col,t_row))
	row_b = cursor_b.fetchone()

	tile_id_b = ''.join(row_b)

	sql_test_update_tile = 'SELECT tile_data FROM images WHERE tile_id = "'+tile_id_b+'";'
	cursor_a.execute(sql_test_update_tile)
	tile_data = cursor_a.fetchone()
	
	temp = StringIO.StringIO() # this is a file object
	merged_two.save(temp, "PNG")
	pngStr = temp.getvalue()
	pngStrBuffer = buffer(pngStr)
	
	cursor_a.execute("REPLACE into images(tile_id, tile_data) VALUES(?,?);", (tile_id_a, pngStrBuffer))

	tileset_a.conn.commit()
	tileset_b.conn.commit()
	print("working " +tile_id_b)
	print("merged "+ str(t_zoom)+ ", "+ str(t_col)+ ", "+ str(t_row))

subprocess.call ("sh mbtiles_patch.sh "+mb_a+ " " + mb_b, shell=True)