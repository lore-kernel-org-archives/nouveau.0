From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Fwd: [Mesa3d-dev] gallium-winsys-handle-rebased branch
Date: Sun, 7 Mar 2010 18:32:14 +0100
Message-ID: <b67489df1003070932q72b13e4cldfc9c929ef29d4e6@mail.gmail.com>
References: <1267713656.6653.210.camel@toffee>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1267713656.6653.210.camel@toffee>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Afaik calim is the main one working on nouveau gallium and he
obviously already saw that branch since he made a commit there. But
just in case anyone else interested missed it :
http://cgit.freedesktop.org/mesa/mesa/log/?h=3Dgallium-winsys-handle-rebased
http://cgit.freedesktop.org/mesa/mesa/commit/?h=3Dgallium-winsys-handle-reb=
ased&id=3D3bd622d64ec3826d3563a5cd9790cd7accc123b4

---------- Forwarded message ----------
From: Keith Whitwell <keithw-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
Date: Thu, Mar 4, 2010 at 3:40 PM
Subject: [Mesa3d-dev] gallium-winsys-handle-rebased branch
To: "mesa3d-dev-TtF/mJH4Jtrk1uMJSBkQmQ@public.gmane.org" <mesa3d-dev-TtF/mJH4Jtrk1uMJSBkQmQ@public.gmane.org>


This branch is hopefully ready for broader testing ahead of a merge.

Can people, especially nv people, pull this down and try it out. =A0Jakob
has made a best effort to get this right, but neither of us have
hardware.

The branch itself is the start of a significant cleanup of some of the
uglier bits of gallium, particularly the integration with cross-process
shared surfaces, swapbuffers, etc.

Keith
