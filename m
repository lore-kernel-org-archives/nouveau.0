From: Sven Joachim <svenjoac@gmx.de>
Subject: Re: [REGRESSION] system does not resume from ram due to commit
	"drm/nv50/fifo: prevent races between clients updating playlists"
Date: Tue, 28 May 2013 20:55:29 +0200
Message-ID: <87wqqj2au6.fsf@turtle.gmx.de>
References: <CAGZ4FET7yZ0zpWen1HtaQ+tT8s08cYzTL=_QkTOvgiy0=FnJgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAGZ4FET7yZ0zpWen1HtaQ+tT8s08cYzTL=_QkTOvgiy0=FnJgg@mail.gmail.com>
	(Maarten Maathuis's message of "Sun, 26 May 2013 23:09:09 +0200")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Maarten Maathuis <madman2003@gmail.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On 2013-05-26 23:09 +0200, Maarten Maathuis wrote:

> My NV96 does not resume from suspend to ram (the screen stays black, magic
> sysrq keys do work) with the current linus git kernel, i bisected it to the
> following commit.
>
> drm/nv50/fifo: prevent races between clients updating playlists
> b5096566f6e1ee2b88324772f020ae9bc0cfa9a0
>
> It's not obvious to me how this causes problems, but reverting this commit
> does solve my problem.

Same here on my NV86.

Cheers,
       Sven
