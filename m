From: Tom Stellard <tstellar@gmail.com>
Subject: Re: [PATCH 0/4] Convert Nouveau gallium drivers to
 automake
Date: Thu, 2 Aug 2012 20:40:07 -0400
Message-ID: <20120803004006.GA3379@thinkpadr51e>
References: <1343951590-31439-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1343951590-31439-1-git-send-email-dev@lynxeye.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Lucas Stach <dev@lynxeye.de>
Cc: nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Fri, Aug 03, 2012 at 01:53:06AM +0200, Lucas Stach wrote:
> Trivial series to convert Nouveau gallium drivers to automake
> in order to generate Makefiles.
> =

> This is just the general direction in which the MESA buildsystem
> is moving. Aside from this it makes the "make" output a lot more
> readable and therefore helps to spot compiler warnings more easily.
> =

> Lucas Stach (4):
>   nouveau: use automake to generate Makefile
>   nv30: use automake to generate Makefile
>   nv50: use automake to generate Makefile
>   nvc0: use automake to generate Makefile
>

Hi Lucas,

I haven't had time to clean up these patches[1] yet, but there are
examples in that series of how to build both .a and .la libraries at
the same time (see [PATCH 3/6] r300g: Build a libtool archive), which
will make it easier to transition the gallium targets to automake.
You may want to do the same with the nouveau builds.

-Tom

[1]
http://www.mail-archive.com/mesa-dev@lists.freedesktop.org/msg23538.html


>  configure.ac                            |  4 ++++
>  src/gallium/drivers/nouveau/Makefile    | 16 ----------------
>  src/gallium/drivers/nouveau/Makefile.am | 16 ++++++++++++++++
>  src/gallium/drivers/nv30/Makefile       | 12 ------------
>  src/gallium/drivers/nv30/Makefile.am    | 16 ++++++++++++++++
>  src/gallium/drivers/nv50/Makefile       | 12 ------------
>  src/gallium/drivers/nv50/Makefile.am    | 25 +++++++++++++++++++++++++
>  src/gallium/drivers/nvc0/Makefile       | 12 ------------
>  src/gallium/drivers/nvc0/Makefile.am    | 25 +++++++++++++++++++++++++
>  9 Dateien ge=E4ndert, 86 Zeilen hinzugef=FCgt(+), 52 Zeilen entfernt(-)
>  delete mode 100644 src/gallium/drivers/nouveau/Makefile
>  create mode 100644 src/gallium/drivers/nouveau/Makefile.am
>  delete mode 100644 src/gallium/drivers/nv30/Makefile
>  create mode 100644 src/gallium/drivers/nv30/Makefile.am
>  delete mode 100644 src/gallium/drivers/nv50/Makefile
>  create mode 100644 src/gallium/drivers/nv50/Makefile.am
>  delete mode 100644 src/gallium/drivers/nvc0/Makefile
>  create mode 100644 src/gallium/drivers/nvc0/Makefile.am
> =

> -- =

> 1.7.11.2
> =


> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/mesa-dev
