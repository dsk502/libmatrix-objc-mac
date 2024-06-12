//
//  DoubleMatrix.h
//  libmatrix
//
//  Created by dsk502 on 2/2/2024.
//

#import "Matrix.h"

#import <Foundation/Foundation.h>

@interface DoubleMatrix : Matrix {
@public
    double **numbers;
}

- (id) init;
- (id) initZeroWithRows: (int) numOfRows Columns: (int) numOfCols;
- (id) initWithRows: (int) numOfRows Columns: (int) numOfCols Numbers: (double[]) numbers;

- (DoubleMatrix*) add: (DoubleMatrix*) matrixTwo;
- (DoubleMatrix*) subtract: (DoubleMatrix*) matrixTwo;
- (DoubleMatrix*) multiplyByNumber: (double) multiplier;
- (DoubleMatrix*) multiplyByMatrix: (DoubleMatrix*) matrixTwo;

@end
