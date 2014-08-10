From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Coordinate systems on on nv10-era cards
Date: Sun, 10 Aug 2014 19:32:20 -0400
Message-ID: <CAKb7UviRF5BJhrVuznLuv-iaK45PRs_LzJjrM8xqbgNwteHkuA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hello,

I'm trying to debug why fbo-copyteximage-simple is failing, and I'm...
failing. It's an extremely simple test. I'm pretty sure that the
copyteximage part of it has nothing to do with the failure, at least
it behaves identically when I just return tex instead of copiex_tex.

Without any modifications, the test just renders one big red square. I
think there's something wrong with the coordinate systems since if I
change

glColor4fv(red);
piglit_draw_rect(0, 0, TEX_WIDTH / 2, TEX_HEIGHT / 2);

to instead be

piglit_draw_rect(1, 1, TEX_WIDTH / 2, TEX_HEIGHT / 2);

Then the result is all black. So I think that the coordinates are
being scaled up somewhere they're not supposed to be (or, conversely,
not being scaled down when they are supposed to be). The projection
matrix sent to the card is {x - 128, y - 128, z * 32767.5, 1 }. Should
it be scaling the coordinates down to the -1, 1 range instead? i.e. is
get_viewport_scale() just totally wrong? Or something in
nv10_emit_projection?

Ideas welcome :)

  -ilia
