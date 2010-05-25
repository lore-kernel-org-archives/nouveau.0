From: Bryan Quigley <BryanQuigley-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Subject: Nvidia says I have a 8200,
	but lspci says a GeForce 9200M G
Date: Tue, 25 May 2010 20:16:37 +0530
Message-ID: <AANLkTilqRYN9lAFciH9JPUp4upw2wpzyxIOyweQkDOxd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
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

Hello all,

I'm debugging a card that the Nvidia blob recognizes as an 8200 but
lspci says is a GeForce 9200M G. =A0My original bug report is in
launchpad.(https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nou=
veau/+bug/557895),
but I have been trying to debug further by using the nightly builds.
It still requires the noaccel flag to be set to work.

I was wondering if there is anyway I could force it to be detected as
a 8200 with nouveau.  I am guessing that it may be using some accel
features of the 9200 and that's the reason it doesn't work.  PCI ID is
10de:086f

Thanks!
Bryan

P.S. Off list, please respond directly. Thanks.
