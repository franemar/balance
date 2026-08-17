import type { ValidationAcceptor, ValidationChecks } from 'langium';
import type { FinclangAstType, Person } from './generated/ast.js';
import type { FinclangServices } from './finclang-module.js';

/**
 * Register custom validation checks.
 */
export function registerValidationChecks(services: FinclangServices) {
    const registry = services.validation.ValidationRegistry;
    const validator = services.validation.FinclangValidator;
    const checks: ValidationChecks<FinclangAstType> = {
        Person: validator.checkPersonStartsWithCapital
    };
    registry.register(checks, validator);
}

/**
 * Implementation of custom validations.
 */
export class FinclangValidator {

    checkPersonStartsWithCapital(person: Person, accept: ValidationAcceptor): void {
        if (person.name) {
            const firstChar = person.name.substring(0, 1);
            if (firstChar.toUpperCase() !== firstChar) {
                accept('warning', 'Person name should start with a capital.', { node: person, property: 'name' });
            }
        }
    }

}
