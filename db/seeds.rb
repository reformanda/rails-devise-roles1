user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

NominationType.create!([
  {year: "2016", code: "Packard", description: "The David Packard Excellence in Acquisition Award, sponsored by the Under Secretary of Defense for Acquisition, Technology, and Logistics (USD(AT&L)), recognizes Department of Defense civilian and military organizations, groups, or teams who have demonstrated exemplary innovation and best practices in the acquisition of products and services. This award reflects achievements that exemplify goals and objectives established for furthering life cycle cost reduction and/or acquisition excellence in the Department. Multiple teams may receive the award based on merit. This call for nominations application is for nominations from the U.S. Army. The U.S. Army Acquisition Support Center (USAASC) is the official collection point for U.S. Army nominations. USAASC will compile the nominations and submit to senior leadership, who will then select and forward the Army submissions to USD(AT&L) for consideration. ", nomination_end_date: "04/27/2016"}
])
