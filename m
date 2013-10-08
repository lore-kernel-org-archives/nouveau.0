From: =?ISO-8859-1?Q?=22Christian_E=2E_J=F8rgensen=22?= <cjn-FZFt1+7s/NtvVx6mj8xitFpr/1R2p/CL@public.gmane.org>
Subject: HDMI overscan compensation
Date: Tue, 08 Oct 2013 22:17:10 +0200
Message-ID: <52546846.3040300@post1.dansknet.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
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

Hi,

I have a GeForce 210-based video card hooked up to an LG monitor =

(IPS235P) via HDMI. At boot time, the video card displays an image on =

the monitor that is scaled down and surrounded by a black border =

approximately one inch in width. As far as I've been able to determine, =

this black border is caused by the video card attempting to compensate =

for any overscanning done by the monitor. Since the monitor doesn't DO =

any overscanning, I'd like to PERMANENTLY disable the overscan =

compensation on the video card. I guess this requires modifying the =

video BIOS. Does anyone know what needs to be done and how?

Best regards,
Christian J=F8rgensen
