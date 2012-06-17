From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50571] nouveau crashes with GeForce GT 520
Date: Sun, 17 Jun 2012 03:01:39 +0000
Message-ID: <bug-50571-8800-T6qXa2ouKD@http.bugs.freedesktop.org/>
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

--- Comment #14 from Gedalya <gedalya-UGXokjX7p+DR7s880joybQ@public.gmane.org> 2012-06-16 20:01:39 PDT ---
On 6/16/2012 8:54 PM, bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org wrote:
> Thanks again for your hard work tracking this down.
Thank you!! You've been very helpful and this is a great learning 
experience!

> Please test the attached patch against the 3.3.y tree, like so:
>    # hopefully it reproduces the problem. So try the patch:
It did indeed.
>    cd linux
>    git am -3sc /path/to/patch
>    make deb-pkg; # maybe with -j4
>    dpkg -i ../<name of package>
>    reboot
>
So yea, it applied with no issues, compiled, and the computer seems to 
be quite usable, installed chromium etc. and so far so good.

This thing showed up, as before -
[   60.936501] colord[2769]: segfault at 8 ip 000000000040bc6d sp 
00007fff020a9110 error 4 in colord[400000+20000]
Not sure what it is, perhaps something else is wrong somewhere, perhaps 
unrelated.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
