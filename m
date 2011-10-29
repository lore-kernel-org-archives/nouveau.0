From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: "enable ctxprog xfer only when we need it to save power"
 introduces big performance regression
Date: Sat, 29 Oct 2011 19:08:01 +0200
Message-ID: <20111029170801.GA3219@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi

I've bisected pretty big performance regression (nv92):

$ git bisect good
b2737681d5442f05ab6419e05468c3d2511a5ced is the first bad commit
commit b2737681d5442f05ab6419e05468c3d2511a5ced
Author: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Date:   Sat Jul 30 23:08:45 2011 +0200

    drm/nv50/gr: enable ctxprog xfer only when we need it to save power

    This patch adds instructions to ctxprog and by doing, impacts context
    switching performance.  My testcase showed a 1% performance cost using
    glxgears that is a context-switch bound application.

    Please test and report bugs/performance/power/other.

    Many thanks to Maxim Levitsky for his dedicated work on lowering power
    consumption with nouveau.

    More patches are coming thanks to his work:

    https://bugs.freedesktop.org/show_bug.cgi?id=37922

    Signed-off-by: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

:040000 040000 3fcd1388cf04c71cb7a11f29f7be6033c948f119 418a527ee5970eabaa0eb6f8cb3dc96b4da523ea M      drivers

The numbers are (FPS):
nexuiz:            61 ->   49 (-19%)
xonotic:           59 ->   37 (-37%)
openarena:        163 ->  127 (-22%)
world of padman:  242 ->  181 (-25%)
warsow:            91 ->   61 (-32%)
glxgears:        1198 -> 1107 (- 7%)

Now, what can we do about it?

Marcin
