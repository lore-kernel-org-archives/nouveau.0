From: Ove Karlsen <ove.karlsen-AeFHuWNXbuEAvSIxZttfnVaTQe2KTcn/@public.gmane.org>
Subject: Jittered antialiasing.
Date: Wed, 07 Nov 2012 15:33:17 +0100
Message-ID: <509A712D.5070700@paradoxuncreated.com>
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

In doom 3, there is a function called "jitter the subsampling matrix" =

(r_jitter)

I thought about doing an improved version of this, but I lack the =

expertise in driver development. But I share the idea with you, so that =

you may implement it, as a lowest resource antialiasing.

Carmack modulates the subsampling with white noise. That gives a =

psychovisual effect, that is a bit noisy, because of low-frequency =

variations. This can be improved by modulating with highpassed noise =

instead.

Also the technique can be improved by blending frames, say 1 frame is =

blended with 30% of second, 20%=A4 of third 10% of fourth. And probably no =

more than that. Ratios and highpass should be tunable also. Maybe a =

lowpass on the noise would be good too, to remove extreme high-freqency.

Then you get jittered antialiasing, that combines several frames of =

different subsampling, to an average psychovisual effect, of higher =

resolution, and antialiasing.

Combining it with just a little smoothing from 2xMSAA and 2xAniso, is =

probably perfect. 2xAniso can be sharpened up with -0.5lodbias, and then =

it gives a smoother/more natural result when close, than higher aniso, =

and still sharp at distance.

Also -  Great performance in games, low latency, fast desktop:

A lot of people have been talking about these things lately. These =

things are already solved, and I sum them up, on my blog, as I have been =

researching the same, for quite some time. : =

http://paradoxuncreated.com/Blog/wordpress/?p=3D2268

John Carmack talks about not being able to run doom 3 at 60fps on =

consoles. So it runs at 30.

I am now running it at 72, with LOW Jitter (constant gliding framerate).
And that is even on what is today a modest dualcore 2.5ghz + a gtx 280.

So this is what you want.

-- =

Fred v=E6re med deg / Peace Be with You,
Ove Karlsen
http://www.paradoxuncreated.com
