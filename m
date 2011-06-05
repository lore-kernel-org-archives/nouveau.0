From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: [PATCH v2 2/2] xorg/nouveau: blacklist all pre NV30
 cards
Date: Sun, 5 Jun 2011 22:35:32 +0200
Message-ID: <20110605203532.GB26259@joi.lan>
References: <20110516195110.GB5456@joi.lan> <20110516222014.GH5456@joi.lan>
	<20110605190626.GE22091@joi.lan>
	<BANLkTikUFyF69p8bUCmLm9jwNvPBNDfFBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <BANLkTikUFyF69p8bUCmLm9jwNvPBNDfFBg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Patrick Baggett <baggett.patrick@gmail.com>
Cc: nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Sun, Jun 05, 2011 at 02:22:19PM -0500, Patrick Baggett wrote:
>    Wasn't nouveau targeted to provide HW acceleration for old cards like
>    the TNT2, or has that idea been killed?
> 

This patch is for Gallium3D accelerated 2D xorg driver.
Nobody is killing support for old cards from xf86-video-nouveau.

Marcin
