//
//  DoubleMatrix.h
//  libmatrix
//
//  Created by dsk502 on 2/2/2024.
//

#import <Foundation/Foundation.h>

@interface DoubleMatrix : NSObject {
@public
    int numOfRows;
    int numOfCols;
    double* numbers[];
}

@end
