// // namespace com.ibm;


// // context demo {
    
// //     entity student {
// //         key id: String(32);
// //         firstName: String(80);
// //         lastName: String(80);
// //         grade: Int16;
// //         gender: String(1);
// //     }


// //     entity class {
// //         key id: Int16;
// //         className: String(80);
// //         semester: Int16;
// //         specialization: String(60);
// //     }


// // }

// // namespace com.ibm;


// // context demo {
    
// //     entity student {
// //         key id: String(32);
// //         firstName: String(80);
// //         lastName: String(80);
// //         // Create foreign key relationship between tables
// //         grade: Association to one class;
// //         gender: String(1);
// //     }


// //     entity class {
// //         key id: Int16;
// //         className: String(80);
// //         semester: Int16;
// //         specialization: String(60);
// //     }
    
// //     entity book {
// //         key id: String(32);
// //         bookName: String(80);
// //         author: String(80);
// //     }
// // }


// // context trans {
    
// //     entity subs {
// //         key id: String(32);
// //         student: Association to one demo.student;
// //         book: Association to one demo.book;
// //     }


// // }


// namespace com.ibm;
// using { demo.reuse as spiderman } from './reuse';



// context demo {
    
//     //consume aspect to get the address field added to employee table automatically
//     entity student: spiderman.address {
//         key id: spiderman.Guid;
//         firstName: String(80);
//         lastName: String(80);
//         // Create foreign key relationship between tables
//         grade: Association to one class;
//         gender: String(1);
//     }


//     entity class {
//         key id: Int16;
//         className: String(80);
//         semester: Int16;
//         specialization: String(60);
//     }
    
//     entity book {
//         key id: spiderman.Guid;
//         bookName: String(80);
//         author: String(80);
//     }
// }


// context trans {
    
//     entity subs {
//         key id: spiderman.Guid;
//         student: Association to one demo.student;
//         book: Association to one demo.book;
//     }


// }


namespace com.ibm;
using { demo.reuse as spiderman } from './reuse';
using { cuid, managed,temporal } from '@sap/cds/common';



context demo {
    
    //consume aspect to get the address field added to employee table automatically
    entity student: spiderman.address {
        key id: spiderman.Guid;
        firstName: String(80);
        lastName: String(80);
        // Create foreign key relationship between tables
        grade: Association to one class;
        gender: String(1);
    }


    entity class {
        key id: Int16;
        className: String(80);
        semester: Int16;
        specialization: String(60);
    }
    
    // entity book {
    //     key id: spiderman.Guid;
    //     bookName: String(80);
    //     author: String(80);
    // }

    entity book {
        key id: spiderman.Guid;
        bookName: localized String(80);
        author: String(80);
    }
}


context trans {
    
    entity subs: cuid, temporal, managed {
        //key id: spiderman.Guid;
        student: Association to one demo.student;
        book: Association to one demo.book;
    }


}