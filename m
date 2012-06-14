From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50571] nouveau crashes with GeForce GT 520
Date: Thu, 14 Jun 2012 01:43:24 +0000
Message-ID: <bug-50571-8800-n3qTE1nnrD@http.bugs.freedesktop.org/>
References: <bug-50571-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50571-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=50571

--- Comment #10 from Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-06-13 18:43:24 PDT ---
Gedalya <gedalya-UGXokjX7p+DR7s880joybQ@public.gmane.org> wrote:

> OK, anything else I can do to help?

If you can find the fix by bisecting, that would make me very happy.

Note that this will be a little confusing.  When you say "git bisect
bad", that means the kernel did _not_ exhibit the problem.  When you
say "git bisect good", that means the kernel _did_ exhibit the
problem.  The "first bad commit" is the patch that fixed it. :)

It works like this:

    cd linux
    git bisect start v3.5-rc1 v3.3 -- drivers/gpu/drm/nouveau
    make deb-pkg; # maybe with -j4

That builds a version half-way between to test.  So:

    dpkg -i ../<name of package>; # as root
    reboot

    cd linux
    git bisect good; # if it crashed
    git bisect bad; # if it worked fine
    git bisect skip; # if some other bug makes it hard to test

Then another version to test will be automatically checked out
and the process continues.

Again, remember: good = crashy.

Finding the patch should take about 8 rounds.  If the gitk package is
installed, you can see the range with the fix narrowing by running
"git bisect visualize" at any step.  If you get bored before the
process finishes, "git bisect log" will list the results discovered so
far.  Even a few rounds can help a lot in narrowing down which patch
is responsible.

Then we should be better prepared to fix this in stable kernels.

Thanks,
Jonathan

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
