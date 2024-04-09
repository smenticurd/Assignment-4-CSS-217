//
//  main.swift
//  Builder
//
//  Created by almat saparov on 09.04.2024.
//

class NutritionPlan {
    var dailyCaloricIntake: Int?
    var macronutrientRatios: (carbohydrates: Int, proteins: Int, fats: Int)?
    var mealPlans: [String]?
    var fitnessGoal: String?
    var dietaryRestrictions: [String]?
    
    func printDetails() {
        print("Daily Caloric Intake: \(dailyCaloricIntake ?? 0) kcal")
        if let ratios = macronutrientRatios {
            print("Macronutrient Ratios - Carbohydrates: \(ratios.carbohydrates)%, Proteins: \(ratios.proteins)%, Fats: \(ratios.fats)%")
        }
        if let plans = mealPlans {
            print("Meal Plans:")
            for plan in plans {
                print("- \(plan)")
            }
        }
        print("Fitness Goal: \(fitnessGoal ?? "Not specified")")
        if let restrictions = dietaryRestrictions {
            print("Dietary Restrictions:")
            for restriction in restrictions {
                print("- \(restriction)")
            }
        }
    }
}

class NutritionPlanBuilder {
    var nutritionPlan = NutritionPlan()
    
    func setCaloricIntake(_ intake: Int) {
        nutritionPlan.dailyCaloricIntake = intake
    }
    
    func setMacronutrientRatios(carbohydrates: Int, proteins: Int, fats: Int) {
        nutritionPlan.macronutrientRatios = (carbohydrates, proteins, fats)
    }
    
    func setMealPlans(_ plans: [String]) {
        nutritionPlan.mealPlans = plans
    }
    
    func setFitnessGoal(_ goal: String) {
        nutritionPlan.fitnessGoal = goal
    }
    
    func setDietaryRestrictions(_ restrictions: [String]) {
        nutritionPlan.dietaryRestrictions = restrictions
    }
    
    func build() -> NutritionPlan {
        return nutritionPlan
    }
}

class NutritionPlanDirector {
    var builder: NutritionPlanBuilder
    
    init(builder: NutritionPlanBuilder) {
        self.builder = builder
    }
    
    func createNutritionPlan() -> NutritionPlan {
        builder.setCaloricIntake(2000)
        builder.setMacronutrientRatios(carbohydrates: 50, proteins: 30, fats: 20)
        builder.setMealPlans(["Breakfast: Eggs and toast", "Lunch: Grilled chicken salad", "Dinner: Salmon with quinoa"])
        builder.setFitnessGoal("Weight loss")
        builder.setDietaryRestrictions(["Gluten-free"])
        
        return builder.build()
    }
}

class WeightLossNutritionPlanBuilder: NutritionPlanBuilder {
    override init() {
        super.init()
        nutritionPlan.fitnessGoal = "Weight loss"
    }
}

class WeightGainNutritionPlanBuilder: NutritionPlanBuilder {
    override init() {
        super.init()
        nutritionPlan.fitnessGoal = "Weight gain"
    }
}

class MaintenanceNutritionPlanBuilder: NutritionPlanBuilder {
    override init() {
        super.init()
        nutritionPlan.fitnessGoal = "Maintenance"
    }
}

let director = NutritionPlanDirector(builder: WeightLossNutritionPlanBuilder())
let nutritionPlan = director.createNutritionPlan()
nutritionPlan.printDetails()
