From: =?ISO-8859-1?Q?St=E9phane_Marchesin?= <stephane.marchesin@gmail.com>
Subject: Re: [Nouveau] [PATCH v2 2/2] xorg/nouveau: blacklist all
	pre NV30 cards
Date: Sun, 5 Jun 2011 12:10:52 -0700
Message-ID: <BANLkTi=rs=TD44LirzwGjR8hWg4Miq4_Hg@mail.gmail.com>
References: <20110516195110.GB5456@joi.lan> <20110516222014.GH5456@joi.lan>
	<20110605190626.GE22091@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <20110605190626.GE22091@joi.lan>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Marcin Slusarz <marcin.slusarz@gmail.com>
Cc: nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Sun, Jun 5, 2011 at 12:06, Marcin Slusarz <marcin.slusarz@gmail.com> wro=
te:
> On Tue, May 17, 2011 at 12:20:14AM +0200, Marcin Slusarz wrote:
>> Bail out early in probe, so other driver can take control of the card.
>> Doing it in screen_create would be too late.
>> ---
>> =A0src/gallium/targets/xorg-nouveau/nouveau_xorg.c | =A0 44 ++++++++++++=
++++++-----
>> =A01 files changed, 35 insertions(+), 9 deletions(-)
>
> ping
>

Why do you need a list of cards for that, as opposed to reading the reg?

St=E9phane
