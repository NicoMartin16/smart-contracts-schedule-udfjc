import { buildModule } from '@nomicfoundation/hardhat-ignition/modules';

const studentModule = buildModule('Student', (module) => {
    const student = module.contract('StudentContract');

    const newStudent = module.call(student, "addStudent", ["CC","1023959749","Nicolas","16-04-1997", "nicolasfelipemartin@gmail.com", "3002367244","calle 78C #110-16"]);
    console.log(newStudent);
    return {student};
});

export default studentModule;