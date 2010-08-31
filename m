From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29525] DVI monitor (via docking station) remains
	blank
Date: Mon, 30 Aug 2010 23:30:05 -0700 (PDT)
Message-ID: <20100831063005.19626130083@annarchy.freedesktop.org>
References: <bug-29525-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29525-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29525

aa_z9-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
  Attachment #37836|0                           |1
        is obsolete|                            |

--- Comment #6 from aa_z9-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org 2010-08-30 23:30:04 PDT ---
Created an attachment (id=38327)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=38327)
Gzipped Tar file containing 6 dmesg outputs (text format).

Hi,

I have performed further testing using the following versions:

git://anongit.freedesktop.org/nouveau/linux-2.6    
1a8315a37e0e3b11daf923d9637321e0ff612e7e

git://anongit.freedesktop.org/nouveau/xf86-video-nouveau
065576d5df0df4da61050d789f548801656b62d5

git://anongit.freedesktop.org/git/mesa/drm/
23287f05cf2443ddf9e028e29beb5bd30979c6cf

After booting with the DVI monitor connected, the DVI monitor remains blank
(dmesg > 1.txt).

After unplugging the DVI cable (2.txt) and plugging it back in, the DVI monitor
displays correctly (3.txt).

After starting X, the DVI monitor only displays the (mouse) cursor (4.txt).

After typing "xrandr --output DVI-D-1 --mode 640x350" the DVI monitor displays
the X screen properly (although at the reduced resolution) (5.txt).

After typing "xrandr --output DVI-D-1 --auto" the DVI monitor displays at the
correct native resolution (6.txt). Note: This command doesn't seem to cause the
DVI monitor to display correctly unless the previous xrandr command (i.e. at
the reduced resolution) is executed.

Two further issues, possibly related issues:
* The mouse cursor dissappears permanently sometimes from LVDS-1, although X is
apparently otherwise unaffected.
* The DVI monitor won't work again after a suspend/resume, even by
unplugging/re-connecting/trying lower resolutions, etc. as above.

Scott

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
