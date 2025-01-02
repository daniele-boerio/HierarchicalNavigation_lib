# README.txt

## Project Setup Instructions

Follow these steps to correctly set up and execute the project:

### 1. Include the Required Libraries
- Add the hierarchical navigation library to your project. You can find it at this link: [https://github.com/daniele-boerio/MOBIDEVProject]
- Add the positioning library to your project. You can find it at this link: [https://github.com/tirannosario/PositioningLibrary]

### 2. Upload Marker Images
- Navigate to the `Assets` folder in your project.
- Upload one or more images that you plan to use as explicit markers.

### 3. Configure the `mapData` File
Structure the `mapData` file as follows:
- Define each building as a floor.
- Define each floor as a room.
- Assign markers to the appropriate rooms by specifying the marker name under the `Image` key.
- Include the location of each marker in the ARKit scene where the marker is physically located.

### 4. Configure the `navigationData` File
- Add data for the various floors and rooms, including doors and navigation points.
- Specify the `cellSize` to be used for navigation.
- Define the `safeArea` for each room.

### 5. Include ARKit Maps
- Place all ARKit maps in the `Maps` folder.
- Ensure that the names of the rooms in the maps match the names used in the `mapData` and `navigationData` files.

By following these instructions, you should be able to set up and run the project successfully.

