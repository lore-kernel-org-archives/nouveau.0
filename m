From: Maarten Maathuis <madman2003@gmail.com>
Subject: Re: [Nouveau] [PATCH v2 2/2] xorg/nouveau: blacklist all
 pre NV30 cards
Date: Sun, 5 Jun 2011 21:15:47 +0200
Message-ID: <BANLkTik4GSV2EQ1ry0K-b-PwbhsuHdZsAw@mail.gmail.com>
References: <20110516195110.GB5456@joi.lan> <20110516222014.GH5456@joi.lan>
	<20110605190626.GE22091@joi.lan>
	<BANLkTi=rs=TD44LirzwGjR8hWg4Miq4_Hg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <BANLkTi=rs=TD44LirzwGjR8hWg4Miq4_Hg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: =?ISO-8859-1?Q?St=E9phane_Marchesin?= <stephane.marchesin@gmail.com>
Cc: nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

2011/6/5 St=E9phane Marchesin <stephane.marchesin@gmail.com>:
> On Sun, Jun 5, 2011 at 12:06, Marcin Slusarz <marcin.slusarz@gmail.com> w=
rote:
>> On Tue, May 17, 2011 at 12:20:14AM +0200, Marcin Slusarz wrote:
>>> Bail out early in probe, so other driver can take control of the card.
>>> Doing it in screen_create would be too late.
>>> ---
>>> =A0src/gallium/targets/xorg-nouveau/nouveau_xorg.c | =A0 44 +++++++++++=
+++++++-----
>>> =A01 files changed, 35 insertions(+), 9 deletions(-)
>>
>> ping
>>
>
> Why do you need a list of cards for that, as opposed to reading the reg?
>
> St=E9phane
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/mesa-dev
>

I agree with Stephane, checking register 0 should work fine. First
check for NV04/05, then for NV10-NV2F.

Maarten.

-- =

Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
