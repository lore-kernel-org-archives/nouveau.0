From: Jakob Bornecrantz <wallbraker@gmail.com>
Subject: Re: [PATCH 2/3] init ps->context with util_surfaces_get
 and do_get
Date: Sun, 5 Dec 2010 01:30:05 +0100
Message-ID: <AANLkTi=BBhhYKNMOV97m84RG4aZ21sVaqOUSB2ag3_AJ@mail.gmail.com>
References: <1291508190-10771-1-git-send-email-chantry.xavier@gmail.com>
	<1291508190-10771-2-git-send-email-chantry.xavier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <1291508190-10771-2-git-send-email-chantry.xavier@gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Xavier Chantry <chantry.xavier@gmail.com>
Cc: nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Sun, Dec 5, 2010 at 1:16 AM, Xavier Chantry <chantry.xavier@gmail.com> wrote:
> Pass pipe_context rather than pipe_screen to util_surfaces_get and
> util_surfaces_do_get so that they can check whether the saved pipe_surface
> have the current context, and init properly a new pipe_surface with the
> current context.
>
> pipe_context is also passed to pipe_surface_reset and pipe_surface_init so
> that context initialization is done in one central place.

Reviewed-by: Jakob Bornecrantz <wallbraker@gmail.com>

[SNIP]
