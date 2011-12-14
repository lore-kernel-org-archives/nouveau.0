From: Stayvoid <stayvoid-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Gentoo HOWTO is outdated
Date: Wed, 14 Dec 2011 20:15:55 +0300
Message-ID: <CAK5fS_GE1mngTA2iYqnyY=-P01GZ3dKFs5K4FddeV=ULkPAT6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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

Hi there!

This HOWTO is outdated:
http://nouveau.freedesktop.org/wiki/GentooEbuilds

x11-base/nouveau-drm from the x11 overlay asks for the 3.2 version of
kernel, but the latest version is 3.1.5.

This advice is also wrong: "These ebuilds do not have any keyword, as
it is usual with cvs/svn/git releases. To be able to install them, you
have to mark them with ** in package.keywords."
Nowadays you should use package.unmask for such purposes.


Cheers!
