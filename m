From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [Bug 71455] Thermal management in nouveau running hot
 3.12.0+ kernel
Date: Sat, 14 Feb 2015 21:56:35 -0500
Message-ID: <CAKb7Uvj89pAucsOWa8z0tgTunQevwbwDJbTBDPOWJ0-w5jkXDA@mail.gmail.com>
References: <bug-71455-8800@http.bugs.freedesktop.org/>
 <bug-71455-8800-iGqqxhAKIA@http.bugs.freedesktop.org/>
 <CAM2RGhTW18BD2t2-C4GfgeeN6Hq4wwmSt43+XzMryD-qvmCgzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0629419521=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAM2RGhTW18BD2t2-C4GfgeeN6Hq4wwmSt43+XzMryD-qvmCgzg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Evan Foss <evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0629419521==
Content-Type: multipart/alternative; boundary=001a113dd2542b1958050f179e55

--001a113dd2542b1958050f179e55
Content-Type: text/plain; charset=UTF-8

On Sat, Feb 14, 2015 at 9:52 PM, Evan Foss <evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Sorry guys I did not understand how bugzilla's user interface works. this
> should be seperate from the thermal management bug..
>
> On Sat, Feb 14, 2015 at 9:51 PM, <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> wrote:
>
>>  Evan Foss <evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed bug 71455
>> <https://bugs.freedesktop.org/show_bug.cgi?id=71455>
>>  What Removed Added  CC   evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>>
>>  *Comment # 7 <https://bugs.freedesktop.org/show_bug.cgi?id=71455#c7> on
>> bug 71455 <https://bugs.freedesktop.org/show_bug.cgi?id=71455> from Evan
>> Foss <evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> *
>>
>> Created attachment 113500 <https://bugs.freedesktop.org/attachment.cgi?id=113500> [details] <https://bugs.freedesktop.org/attachment.cgi?id=113500&action=edit>
>> dmesg text
>>
>> I am running a mid 2012 macbook pro. 650M nVidia chip. There is something funky
>> with the glx rendering. I tried the various things in the troubleshooting guide
>> and got no where. If need be I can email the following two images to the list
>> but I thought I would save everyones mailboxes some bloat.
>> https://www.flickr.com/photos/evanfoss/15912299653/https://www.flickr.com/photos/evanfoss/16507165346/in/photostream/
>>
>> For those in the far future who may find the above links dead the images show
>> glxgears rendering at +3K frames a second. The glxgears window however has
>> blocks missing with only a single pixel in each one being rendered.
>>
>> I have tested the following kernel versions and found this to be true for all
>> of the following.
>>
>> gentoo-sources-3.12.13
>> gentoo-sources-3.14.6
>> gentoo-sources-3.16.1
>>
>>
Try something more recent -- a block compression setup issue was fixed in
some recent kernel version.

--001a113dd2542b1958050f179e55
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On S=
at, Feb 14, 2015 at 9:52 PM, Evan Foss <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Sorry guys I did=
 not understand how bugzilla&#39;s user interface works. this should be sep=
erate from the thermal management bug..<br></div><div class=3D"gmail_extra"=
><br><div class=3D"gmail_quote"><div><div class=3D"h5">On Sat, Feb 14, 2015=
 at 9:51 PM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:bugzilla-daemon@freed=
esktop.org" target=3D"_blank">bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org</a>&gt;</span=
> wrote:<br></div></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"h=
5">
   =20
     =20
   =20
    <div><span><a href=3D"mailto:evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" title=3D"Evan Foss &lt=
;evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org&gt;" target=3D"_blank"> <span>Evan Foss</span></a>
</span> changed
              <a title=3D"NEW - Thermal management in nouveau running hot 3=
.12.0+ kernel" href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D71455=
" target=3D"_blank">bug 71455</a>
          <br>
             <table border=3D"1" cellpadding=3D"8" cellspacing=3D"0">
          <tbody><tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right">CC</td>
           <td>
               =C2=A0
           </td>
           <td><a href=3D"mailto:evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">evan=
foss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>
           </td>
         </tr></tbody></table>
      <p>
        </p><div>
            <b><a title=3D"NEW - Thermal management in nouveau running hot =
3.12.0+ kernel" href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D7145=
5#c7" target=3D"_blank">Comment # 7</a>
              on <a title=3D"NEW - Thermal management in nouveau running ho=
t 3.12.0+ kernel" href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D71=
455" target=3D"_blank">bug 71455</a>
              from <span><a href=3D"mailto:evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" title=3D"Eva=
n Foss &lt;evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org&gt;" target=3D"_blank"> <span>Evan Foss</span=
></a>
</span></b>
        <pre>Created <span><a href=3D"https://bugs.freedesktop.org/attachme=
nt.cgi?id=3D113500" name=3D"14b8b26fe50fb06a_14b8b25d9be68de7_attach_113500=
" title=3D"dmesg text" target=3D"_blank">attachment 113500</a> <a href=3D"h=
ttps://bugs.freedesktop.org/attachment.cgi?id=3D113500&amp;action=3Dedit" t=
itle=3D"dmesg text" target=3D"_blank">[details]</a></span>
dmesg text

I am running a mid 2012 macbook pro. 650M nVidia chip. There is something f=
unky
with the glx rendering. I tried the various things in the troubleshooting g=
uide
and got no where. If need be I can email the following two images to the li=
st
but I thought I would save everyones mailboxes some bloat.=20

<a href=3D"https://www.flickr.com/photos/evanfoss/15912299653/" target=3D"_=
blank">https://www.flickr.com/photos/evanfoss/15912299653/</a>
<a href=3D"https://www.flickr.com/photos/evanfoss/16507165346/in/photostrea=
m/" target=3D"_blank">https://www.flickr.com/photos/evanfoss/16507165346/in=
/photostream/</a>

For those in the far future who may find the above links dead the images sh=
ow
glxgears rendering at +3K frames a second. The glxgears window however has
blocks missing with only a single pixel in each one being rendered.

I have tested the following kernel versions and found this to be true for a=
ll
of the following.=20

gentoo-sources-3.12.13
gentoo-sources-3.14.6
gentoo-sources-3.16.1</pre></div></div></div></div></blockquote></div></div=
></blockquote><div><br></div><div>Try something more recent -- a block comp=
ression setup issue was fixed in some recent kernel version.<br></div></div=
></div></div>

--001a113dd2542b1958050f179e55--

--===============0629419521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0629419521==--
