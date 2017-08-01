import Vue, { ComponentOptions } from 'vue';

import { Project } from '../../models';


interface ProjectList extends Vue {
    // props
    projects: Project[],
    selectedProject: Project,
    projectTaskCounts: {[key: string]: number}
}

let ProjectListOptions = {
    props: {
        projects: {required: true},
        selectedProject: {required: true},
        projectTaskCounts: {required: true}
    },

    template: `
        <base-resource-list
            editor-component="project-editor"
            scope-type="project"
            :resources="projects"
            :selected-resource="selectedProject"
            :resource-task-counts="projectTaskCounts"
            :resource-actions="{
                reorder: 'reorderProjects',
                delete: 'deleteProject'
            }">

            <template scope="props" slot="icon">
                <span class="project-icon"
                      :style="{ 'background-color': '#' + props.resource.colorHex }">
                </span>
            </template>
        </base-resource-list>
    `
} as ComponentOptions<ProjectList>;


export { ProjectListOptions }