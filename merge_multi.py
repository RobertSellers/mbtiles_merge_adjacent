# Run as python merge_multi.py ..\361.mbtiles ..\362.mbtiles

print("Running merge_multi.py")

import os, sys, sqlite3, cStringIO, StringIO, subprocess, pandas
from PIL import Image

if (len(sys.argv) < 3):
	print "Not enough arguments provided"
	sys.exit()
	# mb_a = r"E:\mbtiles\sarmap_grid\singles\361.mbtiles"
	# mb_b = r"E:\mbtiles\sarmap_grid\singles\362.mbtiles"

mb_a =  sys.argv[1]
mb_b =  sys.argv[2]
basename_a = os.path.splitext(os.path.basename(mb_a))[0]
basename_b = os.path.splitext(os.path.basename(mb_b))[0]

subprocess.call ("Rscript adjacencies.R " + mb_a + " " + mb_b, shell=True)
print("R Script Complete")
#subprocess.call ("Rscript E:/mbtiles/sarmap_grid/singles/mbtiles_merge_adjacent/adjacencies.R " + mb_a + " " + mb_b, shell=True)
xyzs = pandas.read_csv('temp_adj.csv')
#xyzs = pandas.read_csv(r"E:\mbtiles\sarmap_grid\singles\mbtiles_merge_adjacent\temp_adj.csv")

class MbtileSet:

    def __init__(self, mbtiles,origin="bottom"):
        self.conn = sqlite3.connect(mbtiles)
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

	def get_rgba(self):
		c = self.conn.cursor()
		c.execute('''select tile_data from tiles 
					where zoom_level = %s 
					and tile_column = %s 
					and tile_row = %s''' % (self.zoom,self.col,self.row))
		row = c.fetchone()
		if not row:
			return None
		raw_tobytes = bytes(row[0])
		bytes_to_string = cStringIO.StringIO(raw_tobytes)
		rgba_image = Image.open(bytes_to_string).convert("RGBA")
		width, height = rgba_image.size
		datas = rgba_image.load()
		for y in xrange(height):
			for x in xrange(width):
				# New background color
				# Finds @backgroundcolor CartoCSS style
				if datas[x, y] == (221, 220, 222, 255):
					datas[x, y] = (221, 220, 222, 0)
		return rgba_image

	def tile_execute_update(self,pngStrBuffer):
		c = self.conn.cursor()
		c.execute('''select tile_id from map 
				  where zoom_level = %s 
				  and tile_column = %s 
				  and tile_row = %s''' % (self.zoom,self.col,self.row))
		row_fetch = c.fetchone()
		tile_id = ''.join(row_fetch)
		c.execute("REPLACE into images(tile_id, tile_data) VALUES(?,?);", (tile_id, pngStrBuffer))
		print("working " +tile_id+ ", " +str(self.zoom) + ", " + str(self.col) + ", " + str(self.row))

	def commit_changes(self):
		print ("committing changes")
		self.conn.commit()
		self.conn.close()

# load mbtiles class objects
tileset_a = MbtileSet(mbtiles=mb_a)
tileset_b = MbtileSet(mbtiles=mb_b)

for index, row in xyzs.iterrows():

	# connect to mbtiles/sqllite db as class
	tile_a = tileset_a.get_tile(int(row['zoom_level']), int(row['tile_column']), int(row['tile_row']))
	tile_b = tileset_b.get_tile(int(row['zoom_level']), int(row['tile_column']), int(row['tile_row']))

	# convert binary png blob to rgba, background color made transparent
	rawpng_2RGB_a = tile_a.get_rgba()
	rawpng_2RGB_b = tile_b.get_rgba()

	# perform composite on each image
	rawpng_2RGB_b.paste(rawpng_2RGB_a, (0, 0), rawpng_2RGB_a)

	# Revert transparencies to alpha 100%
	width, height = rawpng_2RGB_b.size
	datas_merged = rawpng_2RGB_b.load()
	for y in xrange(height):
		for x in xrange(width):
			if datas_merged[x, y] == (221, 220, 222, 0):
				datas_merged[x, y] = (221, 220, 222, 255)

	# create in memory binary png file
	temp = StringIO.StringIO() # this is a file object
	rawpng_2RGB_b.save(temp, "PNG") # save temp file in memory
	pngStr = temp.getvalue()
	pngStrBuffer = buffer(pngStr) # convert png back to binary/buffer

	# Send replace execution on sqllite db
	tile_id_a = tile_a.tile_execute_update(pngStrBuffer)
	#tile_id_b = tile_b.tile_execute_update(pngStrBuffer)


tile_a.commit_changes()
#tile_b.commit_changes()
subprocess.call ("sh mbtiles_patch.sh " + mb_a + " " + mb_b, shell=True)