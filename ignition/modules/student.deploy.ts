import { buildModule } from '@nomicfoundation/hardhat-ignition/modules';

const studentModule = buildModule('Student', (module) => {
    const student = module.contract('StudentContract');

    module.call(student, 'addStudent', []);
    return {student};
});