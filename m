From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Envytools moved to another home,
	please update your git repos!
Date: Wed, 24 Jul 2013 17:01:44 -0400
Message-ID: <51F040B8.9030705@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi fellow Nouveau devs and users,

Envytools' repository moved to another home yesterday. We fixed as many
urls as possible to link to the new repo but there are some links we cannot
fix for you. So, please update your envytools repository to use the new
repository and no other one.

The new repository is https://github.com/envytools/envytools.

Here is a summary of what made us move to this new repository. We hope
this will answer all your questions:

Last week, we grew tired of having multiple copies[1] of the envytools 
repository
and the git hooks mess it involved to keep them in sync. This situation 
happened
because not everyone could push in the same repository. Whether this 
situation
was due the perception of individual developers or actual 
reluctance/unresponsivity
of the repository's gate keepers, this situation happened and we do not want
this to happen again.

In order to avoid this problem again, we decided that all developers 
should get
the administrator rights on the repository. This way, this is both 
no-one's and
everyone's repo. Since we didn't want the new repository to be associated to
anyone, the Pathscale repository didn't look like a valid option as it would
at least bias some developers' perception that it isn't community-driven.

Two solutions were possible. Either we migrated everyone on the currently-
existing sourceforge repository or we migrated to a new place like github.
I set up a poll[2] explaining this situation and 6 persons voted. 5 were 
for the
creation of a github organization managing the envytools repo and 1 was
for using the already-existing sourceforge repo.

Out of the 5 persons who voted for creating a github organization, 2 
proposed
not to name the organization nouveau-drv, but envytools instead. This
proposition makes sense as envytools is now being used outside the Nouveau
community[3]. We thus created the envytools organization on github and
added most envytools developers as administrators.

I then contacted Pathscale, explained the situation and wondered if it was
possible to transfer the ownership of envytools to the new organization
or if it was possible to delete/hide their envytools repository since it
isn't the canonical repository anymore. After some discussion, the
later happened and I am thankful Pathscale didn't keep their repo public.
Naturally, they do have the administration rights on the new organization.

The original repository will soon be deleted or hidden by its original 
creator.
Unfortunately, the sourceforge repo cannot be deleted because of 
Sourceforge's
policy of forbidding deletion of projects. We may however empty its 
content to
make it obvious to people that it isn't the right repository.

All in all, the migration seems to be going well and we are truly sorry 
for the
noise it generated. If anyone lost push-rights to envytools, please ping us
on #nouveau and we will provide it back to you!

Cheers,

Martin (mupuf), on behalf of the Nouveau team

[1] There were 3 repositories, the original one at 0x04.net, one at 
sourceforge
       and one on github/pathscale. I will not link to them because I 
don't want to
       increase the google rank of these now-obsolete repository.

[2] https://stellarsurvey.com/Analyzer/Analyze.aspx?sid=95790
[3] https://github.com/freedreno/envytools
