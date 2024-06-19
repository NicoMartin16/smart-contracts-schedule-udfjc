import { buildModule } from '@nomicfoundation/hardhat-ignition/modules';

const studentModule = buildModule('Student', (module) => {
    const student = module.contract('StudentContract');
    const course = module.contract('CourseContract');
    const professor = module.contract('ProfessorContract');
    const room = module.contract('RoomContract');
    return {student, course, professor, room};
});

export default studentModule;