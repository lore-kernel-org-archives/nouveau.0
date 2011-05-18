From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31961] [drm:drm_crtc_helper_set_config] *ERROR*
 failed to set mode on [CRTC:6]
Date: Wed, 18 May 2011 12:37:57 -0700 (PDT)
Message-ID: <20110518193757.126D413004E@annarchy.freedesktop.org>
References: <bug-31961-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31961-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31961

--- Comment #7 from avi142-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-05-18 12:37:56 PDT ---
On a fresh F15.RC1 install, I can't get past the login screen due to this bug.

My dmesg output is the same as previously posted.

My motherboard:

dmidecode | grep -i 'Base Board Information' -A4 -B1
Handle 0x0002, DMI type 2, 8 bytes
Base Board Information
    Manufacturer: Hewlett-Packard
    Product Name: 0844
    Version: 123
    Serial Number: [omitted]

My graphics card:

lspci | grep 'VGA'
01:00.0 VGA compatible controller: nVidia Corporation NV18GL [Quadro4 380 XGL]
(rev a2)

I am considering trying to remove the nouveau driver and replacing it with the
proprietary driver. Is there an alternative to this?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
