using {portfolio as my} from '../db/schema';

service MyPortfolio {
    entity BasicInfo  as projection on my.BasicInfo;
    entity Experience as projection on my.Experience;
    entity Skills     as projection on my.Skills;
    entity Projects   as projection on my.Projects;
}
