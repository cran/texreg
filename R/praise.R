#' Publish praise about \pkg{texreg}
#'
#' Publish praise about \pkg{texreg} to help the developers demonstrate impact.
#'
#' The \code{\link{praise_interactive}} function asks you 11 questions
#' interactively on the R console. You can choose to answer or skip them. Some
#' questions are mandatory but most are optional. After collecting your answers,
#' it will call the \code{\link{praise}} function to submit your praise. You can
#' also choose to use the \code{\link{praise}} function directly and supply your
#' answers as arguments. Either way is fine.
#'
#' Before your praise is submitted, the functions will present an interactive
#' menu and ask if you want to submit the praise now. So do not worry about
#' accidentally submitting feedback.
#'
#' You can use these functions to praise the \pkg{texreg} package. Funders and
#' academic employers are increasingly interested in seeing evidence for the
#' impact academic research generates. For software, such as \pkg{texreg}, this
#' is very hard to accomplish because the developers are usually disconnected
#' from the users. The consequence is that incentives for developing
#' packages like these are diminishing the more the funders and employers
#' require evidence of impact on society, firms, or policy makers.
#'
#' The \code{\link{praise}} and \code{\link{praise_interactive}} functions are
#' our attempt at rectifying the situation. With these functions, you can
#' provide positive feedback to the developers. The praise is saved to a
#' database on the web server of the package maintainer and subsequently
#' displayed at \url{https://www.philipleifeld.com/praise/} for other users,
#' funders, and employers to view. This will also enable the package authors to
#' compile reports about how \pkg{texreg} is used by academic and non-academic
#' users to increase their productivity and work quality, for example in the
#' form of an impact case study for the next round of the UK Research Excellence
#' Framework (REF).
#'
#' We need many positive examples of how \pkg{texreg} has an impact on your
#' work. We are especially interested in non-academic users, but welcome
#' feedback from anyone. So please contribute by using the praise function! Tell
#' us how cool this package is and how it has changed your work!
#'
#' The minimal information we require from you is whether you are an academic or
#' non-academic user, the name of your organization, and some free-form praise
#' (of a general nature, or about how it makes you more productive, or about how
#' it increases the quality of your work or reporting). But there are some
#' additional fields. While we are happy with the basic information, of course
#' we will be happier if we also know your name, how to contact you, what kinds
#' of models you work with, and some other details. Your choice!
#'
#' Please note that by using the \code{\link{praise}} or
#' \code{\link{praise_interactive}} function you agree that the information you
#' provide through the function, including your approximate location, is stored
#' online in a database, displayed on the website of the package author, and
#' used in reports to funders, employers etc. (This is the whole purpose of it.)
#' You can contact the package maintainer any time to have your praise removed
#' within a few days.
#'
#' @param academic_user Should be \code{TRUE} if you are at a university or
#'   public research institute. Should be \code{FALSE} if you are a private
#'   user, for example you are using \pkg{texreg} in your work for a firm, NGO,
#'   association, government department, as an individual user etc. We
#'   particularly need praise from non-academic users to demonstrate societal
#'   impact, but we can also make the case for academic usage to generate impact
#'   indirectly.
#' @param organization Please tell us the name of the organization for which you
#'   are using \pkg{texreg}. If we can show that the package is being employed
#'   in a number of different settings, this will help us demonstrate impact.
#' @param name (Optional) We would be delighted to to know who you are. After
#'   all, we can quote you much more effectively if we can tell the funders and
#'   employers who provided this praise! If possible, include your title.
#' @param general_praise Use this argument to provide general praise, for
#'   example about the way it was designed, the user support you have received,
#'   or just how much you enjoy using it. While this is useful, however, we
#'   would be even more interested in receiving statements in how \pkg{texreg}
#'   makes you more productive (in the \code{increase_productivity} argument) or
#'   how it increases the quality of your work or your reports (through the
#'   \code{increase_quality} argument). Note: you need to provide at least one
#'   of these three free-form text arguments.
#' @param increase_productivity This is one of the fields we are most interested
#'   in. Please use this field to tell us how \pkg{texreg} is making you more
#'   productive. For example, does it speed up writing your articles or research
#'   reports? Does it enable you to skip manual work like copy and paste of your
#'   results into your reports, or to avoid fiddling with table formatting? How
#'   much time has it saved you so far? Are there any other benefits in terms of
#'   productivity you can think of? Note: you need to provide feedback using at
#'   least one of the three free-form arguments (\code{general_praise},
#'   \code{increase_productivity}, or \code{increase_quality}).
#' @param increase_quality This is one of the fields we are most interested in.
#'   Please use this argument to tell us how \pkg{texreg} increases the quality
#'   of your work or the quality of your reporting. For example, does the
#'   package generate tables that look more professional than the tables you
#'   used to create manually? Are you using \link{screenreg} to improve your
#'   workflow by understanding better how the results of multiple models
#'   compare? Are you using \link{plotreg} to visualize and present your
#'   statistical results in a more effective way? Can you think of any other
#'   ways in which \pkg{texreg} is helping you? Note: you need to provide
#'   feedback using at least one of the three free-form arguments
#'   (\code{general_praise}, \code{increase_productivity}, or
#'   \code{increase_quality}).
#' @param start_using (Optional) When did you start using \pkg{texreg}? We are
#'   interested in the approximate time or year as a free-form text argument,
#'   for example \code{"back in 2013 when the JSS article came out"}.
#' @param where_learn (Optional) Where or how did you learn about the
#'   \pkg{texreg} package?
#' @param contact_details (Optional) Tell us how we can contact you in case we
#'   would benefit from additional information. This might help us further down
#'   the road in compiling an impact case study or a similar report. Don't
#'   worry, this information will not be displayed on the website!
#' @param models (Optional) Which kinds of statistical models do you use in your
#'   work? For example, \code{"Mostly linear models, but also lme4 and ergm."}.
#' @param num_users (Optional) How many other \pkg{texreg} users do you know? In
#'   particular, if you are a non-academic user, would you mind telling us how
#'   many other non-academic users you are aware of and how many of them are in
#'   your organization? The more we know, the more convincing our evidence base
#'   will be. This argument accepts \code{numeric} values or more detailed
#'   responses as a \code{character} object.
#' @param return.response If \code{TRUE}, a website with the submitted data will
#'   be returned as a \code{response} object, as defined in the \pkg{httr}
#'   package. You can load the \pkg{httr} package and use the
#'   \code{\link[httr]{content}} function, possibly enclosed in an
#'   \code{\link[base:character]{as.character}} call, to inspect the output and
#'   diagnose any problems with the transmission of the data. Only use this
#'   argument if instructed by the package authors.
#' @return If everything works well, no output is returned (but see the
#'   \code{return.response} argument to change this). If the submission of the
#'   praise to the maintainer fails, a \code{response} object (as defined in the
#'   \pkg{httr} package) will be returned. Should you have any problems, do feel
#'   free to e-mail your praise to the package maintainer directly.
#'
#' @author Philip Leifeld
#' @aliases praise feedback
#' @rdname praise
#'
#' @examples
#' \dontrun{
#' praise(academic_user = TRUE,
#'        organization = "University of Happy Tables",
#'        increase_quality = "Man, I've never seen such pretty tables!")
#' }
#'
#' @import httr
#' @importFrom utils menu
#' @export
praise <- function(academic_user,
                   organization,
                   name = NULL,
                   general_praise = NULL,
                   increase_productivity = NULL,
                   increase_quality = NULL,
                   start_using = NULL,
                   where_learn = NULL,
                   contact_details = NULL,
                   models = NULL,
                   num_users = NULL,
                   return.response = FALSE) {

  # process 'academic_user' argument
  if (is.null(academic_user) || is.na(academic_user) || !is.logical(academic_user) || length(academic_user) != 1) {
    stop("'academic_user' must be TRUE if you are at a university or research institute and FALSE otherwise.")
  }
  if (isTRUE(academic_user)) {
    user_type <- "academic"
  } else {
    user_type <- "non-academic"
  }

  # process 'organization' argument
  if (is.null(organization) || is.na(organization) || !is.character(organization) || length(organization) != 1) {
    stop("'organization' must be the name of your organization. You may write 'private' if your texreg use is restricted to private purposes.")
  }

  # process 'name' argument
  if (!is.null(name) && (is.na(name) || !is.character(name) || length(name) != 1)) {
    stop("Optional 'name' argument: You don't have to leave your name, but we'd be happy if you did!")
  }
  if (is.null(name)) {
    name <- ""
  }

  # process 'general praise', 'increase_productivity', and 'increase_quality' arguments
  if (is.null(general_praise) && is.null(increase_productivity) && is.null(increase_quality)) {
    stop(paste0("At least one of the arguments 'general_praise', 'increase_productivity', or 'increase_quality' must be provided.\n",
                "- 'general_praise': Any praise you want to provide.\n",
                "- 'increase_productivity': Tell us how texreg makes you more productive.\n",
                "- 'increase_quality': Tell us how texreg increases the quality of your work or reporting."))
  }
  if (!is.null(general_praise) && (is.na(general_praise) || !is.character(general_praise) || length(general_praise) != 1)) {
    stop("'general_praise' is a free-form text argument where you can provide any kind of praise.")
  }
  if (is.null(general_praise)) {
    general_praise <- ""
  }
  if (!is.null(increase_productivity) && (is.na(increase_productivity) || !is.character(increase_productivity) || length(increase_productivity) != 1)) {
    stop("'increase_productivity' argument: Tell us how texreg makes you more productive.")
  }
  if (is.null(increase_productivity)) {
    increase_productivity <- ""
  }
  if (!is.null(increase_quality) && (is.na(increase_quality) || !is.character(increase_quality) || length(increase_quality) != 1)) {
    stop("'increase_quality' argument: Tell us how texreg increases the quality of your work or reporting.")
  }
  if (is.null(increase_quality)) {
    increase_quality <- ""
  }

  # process 'start_using' argument
  if (!is.null(start_using) && (is.na(start_using) || !is.character(start_using) || length(start_using) != 1)) {
    stop("Optional 'start_using' argument: Tell us when you started using texreg (as a character string).")
  }
  if (is.null(start_using)) {
    start_using <- ""
  }

  # process 'where_learn' argument
  if (!is.null(where_learn) && (is.na(where_learn) || !is.character(where_learn) || length(where_learn) != 1)) {
    stop("Optional 'where_learn' argument: Tell us where or how you learned about texreg (as a character string).")
  }
  if (is.null(where_learn)) {
    where_learn <- ""
  }

  # process 'contact_details' argument
  if (!is.null(contact_details) && (is.na(contact_details) || !is.character(contact_details) || length(contact_details) != 1)) {
    stop("Optional 'contact_details' argument: How can we reach you if we need to ask for further testimony for our reporting purposes?")
  }
  if (is.null(contact_details)) {
    contact_details <- ""
  }

  # process 'models' argument
  if (!is.null(models) && (is.na(models) || !is.character(models) || length(models) != 1)) {
    stop("Optional 'models' argument: What kinds of statistical models do you use in your work most often?")
  }
  if (is.null(models)) {
    models <- ""
  }

  # process 'num_users' argument
  if (!is.null(num_users) && (is.na(num_users) || length(num_users) != 1 || (!is.numeric(num_users) && !is.character(num_users)))) {
    stop("Optional 'num_users' argument: How many other texreg users do you know approximately? Supply a number or some text.")
  }
  if (is.null(num_users)) {
    num_users <- ""
  } else {
    num_users <- as.character(num_users)
  }

  # collate all information and submit
  query <- list("package" = "texreg",
                "user_type" = user_type,
                "organization" = organization,
                "general_praise" = general_praise,
                "increase_productivity" = increase_productivity,
                "increase_quality" = increase_quality,
                "start_using" = start_using,
                "where_learn" = where_learn,
                "name" = name,
                "contact_details" = contact_details,
                "models" = models,
                "num_users" = num_users)
  url <- "https://praise.philipleifeld.com/index.php"

  # present menu, then submit
  if (menu(choices = c("Yes, submit now!", "No, cancel!"), title = "Submit your praise now?") == 1) {
    tryCatch(response <- POST(url = url, body = query),
             error = function(e) message("Praise could not be sent. Please check your internet connection.\n",
                                         "If this does not help, perhaps the server is currently down."))
  } else {
    stop("Submission of praise canceled by user.")
  }

  # user feedback
  if (grepl("<p>User type: (non-academic)|(academic)</p>", as.character(httr::content(response)))) {
    message("Success! Thank you so much for providing feedback.")
    message("This will be valuable in demonstrating the impact of texreg to funders.")
    message("You can view all feedback at https://www.philipleifeld.com/praise/.")
    if (isTRUE(return.response)) {
      return(response)
    }
  } else {
    message("Oops, something went wrong...")
    message("Returning website response now as an httr 'response' object.")
    return(response)
  }
}

#' @rdname praise
#'
#' @importFrom utils menu
#' @export
praise_interactive <- function() {
  cat("\n")
  msg_aca <- paste0("Should be 'Yes' if you are at a university or public ",
                    "research institute. Should be 'No' if you are a private ",
                    "user, for example if you are using texreg in your work ",
                    "for a firm, NGO, association, government department, as ",
                    "an individual user etc. We particularly need praise from ",
                    "non-academic users to demonstrate societal impact, but ",
                    "we can also make the case for academic usage to generate ",
                    "impact indirectly.")
  msg_aca <- paste(c("(1/11) Are you an ACADEMIC USER?\n", strwrap(msg_aca)), collapse = "\n")
  academic_user <- menu(choices = c("Yes", "No"), title = msg_aca)
  if (academic_user == 0) {
    stop("Aborted.")
  } else if (academic_user == 1) {
    academic_user <- TRUE
  } else {
    academic_user <- FALSE
  }

  msg_org <- paste0("Please tell us the name of the organization for which ",
                    "you are using texreg. If we can show that the package is ",
                    "being employed in a number of different settings, this ",
                    "will help us demonstrate impact. You may write 'private' ",
                    "if your texreg use is restricted to private purposes.")
  msg_org <- paste(c("\n(2/11) ORGANIZATION NAME.\n", strwrap(msg_org)), collapse = "\n")
  cat(msg_org, "\n\n")
  organization <- trimws(readline("Your organization: "))
  while (organization == "") {
    cat(msg_org, "\n\n")
    organization <- trimws(readline("Your organization: "))
  }

  msg_nam <- paste0("We would be delighted to to know who you are. We can ",
                    "quote your praise much more effectively if we can tell ",
                    "the funders and employers who provided this praise! If ",
                    "possible, include your title. (Leave this field blank if ",
                    "you want to stay anonymous.)")
  msg_nam <- paste(c("\n(3/11) INDIVIDUAL NAME (optional).\n", strwrap(msg_nam)), collapse = "\n")
  cat(msg_nam, "\n\n")
  name_individual <- trimws(readline("Your name: "))
  if (name_individual == "") {
    name_individual <- NULL
  }

  msg_gen <- paste0("Use this field to provide general praise, for example ",
                    "about the way texreg was designed, the user support you ",
                    "have received, or just how much you enjoy using it. ",
                    "(You need to provide either this general praise or ",
                    "details on how texreg increases your productivity or the ",
                    "quality of your work in the next two questions or ",
                    "(better) any combination of the three. Leave this field ",
                    "blank if you want to skip it.)")
  msg_gen <- paste(c("\n(4/11) GENERAL PRAISE (semi-optional).\n", strwrap(msg_gen)), collapse = "\n")
  cat(msg_gen, "\n\n")
  general_praise <- trimws(readline("General praise: "))

  msg_inp <- paste0("This is one of the questions we are most interested in. ",
                    "Please use this field to tell us how texreg is making ",
                    "you more productive. For example, does it speed up ",
                    "writing your articles or research reports? Does it ",
                    "enable you to skip manual work like copy and paste of ",
                    "your results into your reports, or to avoid fiddling ",
                    "with table formatting? How much time has it saved you so ",
                    "far? Are there any other benefits in terms of ",
                    "productivity you can think of? (You need to provide ",
                    "either this praise on productivity or the general praise ",
                    "in the previous question or details on how texreg ",
                    "increases the quality of your work in the next question ",
                    " or (better) any combination of the three. Leave this ",
                    "field blank if you want to skip it.)")
  msg_inp <- paste(c("\n(5/11) PRODUCTIVITY (semi-optional).\n", strwrap(msg_inp)), collapse = "\n")
  cat(msg_inp, "\n\n")
  increase_productivity <- trimws(readline("How does texreg increase your productivity? "))

  msg_inq <- paste0("This is one of the questions we are most interested in. ",
                    "Please use this field to tell us how texreg increases ",
                    "the quality of your work or the quality of your ",
                    "reporting. For example, does the package generate tables ",
                    "that look more professional than the tables you used to ",
                    "create manually? Are you using screenreg to improve your ",
                    "workflow by understanding better how the results of ",
                    "multiple models compare? Are you using plotreg to ",
                    "visualize and present your statistical results in a more ",
                    "effective way? Can you think of any other ways in which ",
                    "texreg in helping you? (You need to provide ",
                    "either this praise on quality or the general praise or ",
                    "productivity praise in the previous two questions or ",
                    "(better) any combination of the three. Leave this ",
                    "field blank if you want to skip it.)")
  msg_inq <- paste(c("\n(6/11) QUALITY OF WORK OR REPORTING (semi-optional).\n", strwrap(msg_inq)), collapse = "\n")
  cat(msg_inq, "\n\n")
  increase_quality <- trimws(readline("How does texreg increase the quality of your work? "))

  while (general_praise == "" && increase_productivity == "" && increase_quality == "") {
    cat(msg_gen, "\n\n")
    general_praise <- trimws(readline("General praise: "))
    cat(msg_inp, "\n\n")
    increase_productivity <- trimws(readline("How does texreg increase your productivity? "))
    cat(msg_inq, "\n\n")
    increase_quality <- trimws(readline("How does texreg increase the quality of your work? "))
  }
  if (general_praise == "") {
    general_praise <- NULL
  }
  if (increase_productivity == "") {
    increase_productivity <- NULL
  }
  if (increase_quality == "") {
    increase_quality <- NULL
  }

  msg_sta <- paste0("When did you start using texreg? We are interested in an ",
                    "approximate time or year as a free-form input, for ",
                    "example 'back in 2013 when the JSS article came out'. ",
                    "(Leave this field blank if you want to skip it.)")
  msg_sta <- paste(c("\n(7/11) START DATE (optional).\n", strwrap(msg_sta)), collapse = "\n")
  cat(msg_sta, "\n\n")
  start_using <- trimws(readline("When did you start using texreg? "))
  if (start_using == "") {
    start_using <- NULL
  }

  msg_whe <- paste0("Where or how did you learn about the texreg package? ",
                    "(Leave this field blank if you want to skip it.)")
  msg_whe <- paste(c("\n(8/11) REFERRAL (optional).\n", strwrap(msg_whe)), collapse = "\n")
  cat(msg_whe, "\n\n")
  where_learn <- trimws(readline("Where or how did you learn about texreg? "))
  if (where_learn == "") {
    where_learn <- NULL
  }

  msg_con <- paste0("Tell us how we can contact you in case we would benefit ",
                    "from additional information. This might help us further ",
                    "down the road in compiling an impact case study or a ",
                    "similar report. An email address would be most helpful. ",
                    "Don't worry, this information will not be displayed on ",
                    "the website! (Leave this field blank if you want to skip ",
                    "it.)")
  msg_con <- paste(c("\n(9/11) CONTACT DETAILS (optional).\n", strwrap(msg_con)), collapse = "\n")
  cat(msg_con, "\n\n")
  contact_details <- trimws(readline("How can we contact you? "))
  if (contact_details == "") {
    contact_details <- NULL
  }

  msg_mod <- paste0("Which kinds of statistical models do you use in your ",
                    "work? For example, 'Mostly linear models, but also lme4 ",
                    "and ergm.'. (Leave this field blank if you want to skip ",
                    "it.)")
  msg_mod <- paste(c("\n(10/11) STATISTICAL MODELS (optional).\n", strwrap(msg_mod)), collapse = "\n")
  cat(msg_mod, "\n\n")
  models <- trimws(readline("Which models do you use? "))
  if (models == "") {
    models <- NULL
  }

  msg_num <- paste0("How many other texreg users do you know? In particular, ",
                    "if you are a non-academic user, would you mind telling ",
                    "us how many other non-academic users you are aware of ",
                    "and how many of them are in your organization? The more ",
                    "we know, the more convincing our evidence base will be. ",
                    "Provide your answer as a free-form text input. (Leave ",
                    "this field blank if you want to skip it.)")
  msg_num <- paste(c("\n(11/11) NUMBER OF USERS (optional).\n", strwrap(msg_num)), collapse = "\n")
  cat(msg_num, "\n\n")
  num_users <- trimws(readline("How many texreg users do you know? "))
  if (num_users == "") {
    num_users <- NULL
  }

  cat("\n----------\nThank you very much for your input. ")
  praise(academic_user = academic_user,
         organization = organization,
         name = name_individual,
         general_praise = general_praise,
         increase_productivity = increase_productivity,
         increase_quality = increase_quality,
         start_using = start_using,
         where_learn = where_learn,
         contact_details = contact_details,
         models = models,
         num_users = num_users,
         return.response = FALSE)
}