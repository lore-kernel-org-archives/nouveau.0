From: Maarten Maathuis <madman2003@gmail.com>
Subject: Re: [PATCH v2 2/2] xorg/nouveau: blacklist all pre NV30
	cards
Date: Sun, 5 Jun 2011 21:23:39 +0200
Message-ID: <BANLkTinKfzuxKnr3dL0vVyoL=zNAjTysgg@mail.gmail.com>
References: <20110516195110.GB5456@joi.lan> <20110516222014.GH5456@joi.lan>
	<20110605190626.GE22091@joi.lan>
	<BANLkTikUFyF69p8bUCmLm9jwNvPBNDfFBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
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

On Sun, Jun 5, 2011 at 9:22 PM, Patrick Baggett
<baggett.patrick@gmail.com> wrote:
> Wasn't nouveau targeted to provide HW acceleration for old cards like the
> TNT2, or has that idea been killed?
> Patrick
>

NV04-NV2F support went into a "classic" driver.

> On Sun, Jun 5, 2011 at 2:06 PM, Marcin Slusarz <marcin.slusarz@gmail.com>
> wrote:
>>
>> On Tue, May 17, 2011 at 12:20:14AM +0200, Marcin Slusarz wrote:
>> > Bail out early in probe, so other driver can take control of the card.
>> > Doing it in screen_create would be too late.
>> > ---
>> > =A0src/gallium/targets/xorg-nouveau/nouveau_xorg.c | =A0 44
>> > ++++++++++++++++++-----
>> > =A01 files changed, 35 insertions(+), 9 deletions(-)
>>
>> ping
>>
>> _______________________________________________
>> mesa-dev mailing list
>> mesa-dev@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/mesa-dev
>
>
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/mesa-dev
>
>



-- =

Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
