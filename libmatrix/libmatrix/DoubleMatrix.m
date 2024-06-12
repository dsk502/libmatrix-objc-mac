//
//  DoubleMatrix.m
//  libmatrix
//
//  Created by dsk502 on 2/2/2024.
//

#import "DoubleMatrix.h"

@implementation DoubleMatrix
- (id) init {
    if(self = [super init]) {
        numOfRows = 0;
        numOfCols = 0;
        numbers = NULL;
    }
    return self;
}

- (id) initZeroWithRows: (int) numOfRows Columns: (int) numOfCols {
    if(self = [super init]) {
        self->numOfRows = numOfRows;
        self->numOfCols = numOfCols;
        self->numbers = (double**)malloc(numOfRows * sizeof(double*));    //Rows first, numbers[i][j] means ith row jth column
        for(int i = 0; i < numOfRows; i++) {
            (self->numbers)[i] = (double*)malloc(numOfCols * sizeof(double));
        }
        for(int i = 0, k = 0; i < numOfRows; i++, k++) {
            for(int j = 0; j < numOfCols; j++) {
                (self->numbers)[i][j] = 0.0;
            }
        }
    }
    return self;
}

- (id) initWithRows: (int) numOfRows Columns: (int) numOfCols Numbers: (double[]) numbers {
    if(self = [super init]) {
        self->numOfRows = numOfRows;
        self->numOfCols = numOfCols;
        //self->numbers = new int*[5];
        self->numbers = (double**)malloc(numOfRows * sizeof(double*));    //Rows first, numbers[i][j] means ith row jth column
        for(int i = 0; i < numOfRows; i++) {
            (self->numbers)[i] = (double*)malloc(numOfCols * sizeof(double));
        }
        for(int i = 0, k = 0; i < numOfRows; i++, k++) {
            for(int j = 0; j < numOfCols; j++) {
                (self->numbers)[i][j] = numbers[k];
            }
        }
    }
    return self;
}

- (DoubleMatrix*) add: (DoubleMatrix*) matrixTwo {
    if(self->numOfRows == matrixTwo->numOfRows && self->numOfCols == matrixTwo->numOfCols) {
        DoubleMatrix* result = [[DoubleMatrix alloc] initZeroWithRows:self->numOfRows Columns:self->numOfCols];
        for(int i = 0; i < numOfRows; i++) {
            for(int j = 0; j < numOfRows; j++) {
                (result->numbers)[i][j] = (self->numbers)[i][j] + (matrixTwo->numbers)[i][j];
            }
        }
        return result;
    }
    else {
        return NULL;
    }
}

//Subtract matrixTwo from this matrix
- (DoubleMatrix*) subtract: (DoubleMatrix*) matrixTwo {
    if(self->numOfRows == matrixTwo->numOfRows && self->numOfCols == matrixTwo->numOfCols) {
        DoubleMatrix* result = [[DoubleMatrix alloc] initZeroWithRows:self->numOfRows Columns:self->numOfCols];
        for(int i = 0; i < numOfRows; i++) {
            for(int j = 0; j < numOfRows; j++) {
                (result->numbers)[i][j] = (self->numbers)[i][j] - (matrixTwo->numbers)[i][j];
            }
        }
        return result;
    }
    else {
        return NULL;
    }
}

- (DoubleMatrix*) multiplyByNumber: (double) multiplier {
    DoubleMatrix* result = [[DoubleMatrix alloc] initZeroWithRows:self->numOfRows Columns:self->numOfCols];
    for(int i = 0; i < numOfRows; i++) {
        for(int j = 0; j < numOfRows; j++) {
            (result->numbers)[i][j] = (self->numbers)[i][j] * multiplier;
        }
    }
    return result;
}

//this matrix * matrixTwo
- (DoubleMatrix*) multiplyByMatrix: (DoubleMatrix*) matrixTwo {
    if(self->numOfCols == matrixTwo->numOfRows) {
        DoubleMatrix* resultMat = [[DoubleMatrix alloc] initZeroWithRows:self->numOfRows Columns:matrixTwo->numOfCols];
        
        for(int i = 0; i < numOfRows; i++)
            for(int j = 0; j < numOfCols; j++)
                for(int p = 0; p < self->numOfCols; p++)
                    (resultMat->numbers)[i][j] += ((self->numbers)[i][p]) * ((matrixTwo->numbers)[p][j]);
        
        return resultMat;
    }
    else {
        return NULL;
    }
}
 
- (void) dealloc {
    for(int i = 0; i < numOfRows; i++) {
        free(numbers[i]);
    }
    free(numbers);
    numbers = NULL;
    NSLog(@"matrix dealloced");
}
@end
