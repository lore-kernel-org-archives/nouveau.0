From: Keith Whitwell <keith.whitwell@googlemail.com>
Subject: Re: [Nouveau] [RFC] Merge of a reincarnation of the
	nouveau classic mesa driver.
Date: Thu, 4 Feb 2010 18:39:14 +0000
Message-ID: <c524168e1002041039y36d0c4c4j64ce52e3d66f150a@mail.gmail.com>
References: <87k4uvvr3r.fsf@riseup.net>
	<b67489df1002021453w3239cbf3t1b946ea816d3e1d9@mail.gmail.com>
	<4B68B91D.8080009@vmware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <mesa3d-dev-bounces@lists.sourceforge.net>
In-Reply-To: <4B68B91D.8080009@vmware.com>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/mesa3d-dev>,
	<mailto:mesa3d-dev-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=mesa3d-dev>
List-Post: <mailto:mesa3d-dev@lists.sourceforge.net>
List-Help: <mailto:mesa3d-dev-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/mesa3d-dev>,
	<mailto:mesa3d-dev-request@lists.sourceforge.net?subject=subscribe>
Errors-To: mesa3d-dev-bounces@lists.sourceforge.net
To: Brian Paul <brianp@vmware.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, mesa3d-dev <mesa3d-dev@lists.sf.net>
List-Id: nouveau.vger.kernel.org

On Tue, Feb 2, 2010 at 11:45 PM, Brian Paul <brianp@vmware.com> wrote:
> Xavier Chantry wrote:
>> On Tue, Feb 2, 2010 at 12:01 PM, Francisco Jerez <currojerez@riseup.net>=
 wrote:
>>> For a long time the gallium pipe drivers for nvidia fixed function cards
>>> (nv0x, nv1x and, to some extent, nv2x) have remained unmaintained and
>>> godforsaken -- especially nv0x and nv1x had seen almost no progress
>>> since their creation.
>>>
>>> They've recently grown a classic mesa driver which implements many new
>>> features: texturing, hardware-accelerated tnl. However the killer
>>> feature is "it actually draws stuff" (and if you're lucky even some
>>> simple games at reasonable FPS) so I don't like to consider this a step
>>> back.
>>>
>>> Right now it is located in a git repo here [1], "mesa-next" is the
>>> branch I'm proposing to merge. I'll reply myself with the patches
>>> affecting core mesa it depends on, to give them more visibility. Of
>>> course driver-related comments are welcome too.
>>>
>>> [1] http://cgit.freedesktop.org/~currojerez/mesa/
>>>
>>
>> I did some testing of a few opengl games, just for fun and by curiosity.
>> Card is nv25 (64mb vram).
>>
>> - works perfectly
>> openarena tremulous xmoto frozen-bubble hedgewars neverball supertux2
>>
>> - works with some problems
>> * teeworlds : perfect after a hack to workaround this issue :
>> =A0 =A0 =A0 =A0nv04_surface.c:246: nv04_surface_copy_swizzle: Assertion
>> `!(dst->offset & 63)' failed.
>>
>> * foobillard : works but this error shows up :
>> =A0 =A0 =A0 Mesa: User error: GL_STACK_OVERFLOW in glPushMatrix(mode=3DG=
L_TEXTURE, unit=3D0)
>
> That's a bug in foobillard. =A0I remember looking into it years ago. =A0I
> guess nobody fixed it yet.

I'm happy to pull this anytime.  Is it ready to go?

Keith

---------------------------------------------------------------------------=
---
The Planet: dedicated and managed hosting, cloud storage, colocation
Stay online with enterprise data centers and the best network in the busine=
ss
Choose flexible plans and management services without long-term contracts
Personal 24x7 support from experience hosting pros just a phone call away.
http://p.sf.net/sfu/theplanet-com
