From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50571] nouveau crashes with GeForce GT 520
Date: Sun, 17 Jun 2012 00:54:10 +0000
Message-ID: <bug-50571-8800-kmkGZNJ89v@http.bugs.freedesktop.org/>
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

--- Comment #13 from Jonathan Nieder <jrnieder-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-06-16 17:54:10 PDT ---
Created attachment 63122
  --> https://bugs.freedesktop.org/attachment.cgi?id=63122
drm/nvd0/disp: disconnect encoders before reprogramming them

Thanks again for your hard work tracking this down.

3.3.y (unlike 3.2.y) is not maintained any more, but the backport
to 3.3 is easier, so let's start there.

Please test the attached patch against the 3.3.y tree, like so:

  cd linux

  # fetch point releases
  git remote add stable \
    git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
  git fetch stable

  # 3.3.y
  git checkout stable/linux-3.3.y
  make silentoldconfig
  make deb-pkg; # maybe with -j4
  dpkg -i ../<name of package>
  reboot

  # hopefully it reproduces the problem. So try the patch:
  cd linux
  git am -3sc /path/to/patch
  make deb-pkg; # maybe with -j4
  dpkg -i ../<name of package>
  reboot

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
