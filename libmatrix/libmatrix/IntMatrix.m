//
//  IntMatrix.m
//  libmatrix
//
//  Created by dsk502 on 2/2/2024.
//

#import "IntMatrix.h"

@implementation IntMatrix
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
        //self->numbers = new int*[5];
        self->numbers = (int**)malloc(numOfRows * sizeof(int*));    //Rows first, numbers[i][j] means ith row jth column
        for(int i = 0; i < numOfRows; i++) {
            (self->numbers)[i] = (int*)calloc(numOfCols, sizeof(int));
        }
    }
    return self;
}

- (id) initWithRows: (int) numOfRows Columns: (int) numOfCols Numbers: (int[]) numbers {
    if(self = [super init]) {
        self->numOfRows = numOfRows;
        self->numOfCols = numOfCols;
        //self->numbers = new int*[5];
        self->numbers = (int**)malloc(numOfRows * sizeof(int*));    //Rows first, numbers[i][j] means ith row jth column
        for(int i = 0; i < numOfRows; i++) {
            (self->numbers)[i] = (int*)malloc(numOfCols * sizeof(int));
        }
        for(int i = 0, k = 0; i < numOfRows; i++, k++) {
            for(int j = 0; j < numOfCols; j++) {
                (self->numbers)[i][j] = numbers[k];
            }
        }
    }
    return self;
}

- (IntMatrix*) add: (IntMatrix*) matrixTwo {
    if(self->numOfRows == matrixTwo->numOfRows && self->numOfCols == matrixTwo->numOfCols) {
        IntMatrix* result = [[IntMatrix alloc] initZeroWithRows:self->numOfRows Columns:self->numOfCols];
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

- (void) dealloc {
    for(int i = 0; i < numOfRows; i++) {
        free(numbers[i]);
    }
    free(numbers);
    numbers = NULL;
}
@end
