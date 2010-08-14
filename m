From: Gilles Ganault <gilles.ganault-GANU6spQydw@public.gmane.org>
Subject: [Ubuntu] Add nouveau without rebooting?
Date: Sat, 14 Aug 2010 13:32:44 +0200
Message-ID: <gavc669iha8r2i0leg6d2gfu5sa869t45c@4ax.com>
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

Hello

	I'm trying to get a liveCD running Xubuntu 9.10 ("2.6.31-20-generic
#57-Ubuntu SMP") to work with an nVidia-based host which can only boot
X in 800x600.

The OS doesn't contain nvidia or nouveau ("modprobe nvidia", "moprobe
nouveau" both fail.)

Since this is a non-persistent liveCD, I can't reboot after adding the
Nouveau driver, so I tried to relaunch X without rebooting:

 1. apt-get install python-software-properties
 2. add-apt-repository ppa:bjfs/ppa
 3. aptitude update
 4. aptitude install xserver-xorg-video-nouveau
 5. Xorg -configure
 6. cp /root/xorg.conf.new /etc/X11/xorg.conf
 7. startx: "FATAL: Module nouveau not found."

Is there a way to add Nouveau without rebooting?

Alternatively, could I just download source files on a regular PC
running Ubuntu, compile a new kernel/modules, replace those in the
ISO, and burn a new CD? I'm a semi-newbie, so I'd need precise
information on how to perform this task.

Thank you.
