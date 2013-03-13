From: =?ISO-8859-1?Q?Sune_M=F8lgaard?= <sune-6pRy+okvdpRg9hUCZPvPmw@public.gmane.org>
Subject: Fwd: [bisected] nouveau failure with 3.9-rc1 and ongoing
Date: Wed, 13 Mar 2013 18:22:38 +0100
Message-ID: <5140B5DE.4070800@molgaard.org>
References: <513F7AB3.3@molgaard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <513F7AB3.3-6pRy+okvdpRg9hUCZPvPmw@public.gmane.org>
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

Hiya,

I sent the enclosed email to linux-kernel before realizing that it =

would, perhaps, be more proper to send it here, which I hereby do.

I shall be happy to try out any and all patches.

Best regards,

Sune M=F8lgaard

-------- Original Message --------
Subject: [bisected] nouveau failure with 3.9-rc1 and ongoing
Date: Tue, 12 Mar 2013 19:57:55 +0100
From: Sune M=F8lgaard <sune-6pRy+okvdpRg9hUCZPvPmw@public.gmane.org>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hiya,

Between 3.8 and 3.9-rc1, the following occurs:

Upon boot, when KMS kicks in, I get a blank screen. Keyboard responds
correctly to "Num Lock" on/off, but machine is unreachable on the network.

Git bisection says:

eb6313add6dddf07ea3e50c4caa33a9c3b2379f1 is the first bad commit
commit eb6313add6dddf07ea3e50c4caa33a9c3b2379f1
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Mon Feb 11 09:52:58 2013 +1000

     drm/nv50: initial kms support for off-chip TMDS/DP encoders

     Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

:040000 040000 41f69d26a80082e19d3c76e6556ad5ef9eb2677d
216d501e053e9d05136929593e90259c2e59dff0 M	drivers

But even though I marked that last bisection kernel good (since it
didn't cause a black-out), it does have problems, namely that GTK themes
are reset, and xrandr seems non-functional, inasmuch as my left-ward,
secondary screen now seems to be treated as being situated to the right.
No previous kernel in the bisection exercise caused anything of the like.

I'd be happy to try out any and all patches proposed, and as for the
physical card, this is the relevant part:

02:00.0 VGA compatible controller: NVIDIA Corporation G92 [GeForce 9800
GT] (rev a2)

Please let me know if there is anything else I can do to help resolve this!

Best regards,

Sune M=F8lgaard

-- =

What a gorgeous day. What effulgent sunshine. It was a day of this
sort the McGillicuddy brothers murdered their mother with an axe.
- W. C. Fields
