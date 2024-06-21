import { buildModule } from '@nomicfoundation/hardhat-ignition/modules';

const studentModule = buildModule('Student',  (module) => {
    
  
    const courseContract = module.contract('CourseContract');   
    
    return {courseContract};
});

export default studentModule;