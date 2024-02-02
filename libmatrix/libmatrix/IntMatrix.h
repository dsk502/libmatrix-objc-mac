//
//  IntMatrix.h
//  libmatrix
//
//  Created by dsk502 on 2/2/2024.
//

#import <Foundation/Foundation.h>

@interface IntMatrix : NSObject {
@public
    int numOfRows;
    int numOfCols;
    int** numbers;
}

- (id) init;    //Create an empty matrix
- (id) initZeroWithRows: (int) numOfRows Columns: (int) numOfCols;  //Create zero matrix
- (id) initWithRows: (int) numOfRows Columns: (int) numOfCols Numbers: (int[]) numbers;
- (IntMatrix*) add: (IntMatrix*) matrixTwo;
- (IntMatrix*) multiply: (IntMatrix*) matrixTwo;
@end
