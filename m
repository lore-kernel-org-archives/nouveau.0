From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 46557] nouveau: NV4E acceleration corruption when
 DMA above 31-bit (2 Gig barrier)
Date: Fri, 30 Nov 2012 17:42:41 +0000
Message-ID: <bug-46557-8800-N59C4O8ZzJ@http.bugs.freedesktop.org/>
References: <bug-46557-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0183044190=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-46557-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0183044190==
Content-Type: multipart/alternative; boundary="1354297361.Cb76264.19921"; charset="us-ascii"


--1354297361.Cb76264.19921
Date: Fri, 30 Nov 2012 17:42:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D46557

--- Comment #27 from Rapha=C3=ABl Droz <gibboris-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 70841
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D70841&action=3Dedit
nouveau CALL_SUBR_ACTIVE errors using dma_bits=3D32 kernel on NV34

I tried your suggestion about setting dma_bits to 32 inside
drivers/gpu/drm/nouveau/core/subdev/vm/nv44.c.
but sadly the same issue arises (dmesg attached).
I hope I'm still wise to post those traces (from my NV34) in this bug report
and hope the root cause is common.
I currently use the drm kernel module with debug=3D2, debug=3D3 dumps too m=
uch
output, but let me know if this can provide additional useful info.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1354297361.Cb76264.19921
Date: Fri, 30 Nov 2012 17:42:41 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - nouveau: NV4E acceleration corruption when DMA above =
31-bit (2 Gig barrier)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D46557#c27">Commen=
t # 27</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - nouveau: NV4E acceleration corruption when DMA above =
31-bit (2 Gig barrier)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D46557">bug 46557<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gibboris&#64;gmail.com" title=3D"Rapha=C3=ABl Droz &lt;gibboris&#64;gmail.c=
om&gt;"> <span class=3D"fn">Rapha=C3=ABl Droz</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D70841"=
 name=3D"attach_70841" title=3D"nouveau CALL_SUBR_ACTIVE errors using dma_b=
its=3D32 kernel on NV34">attachment 70841</a> <a href=3D"attachment.cgi?id=
=3D70841&amp;action=3Dedit" title=3D"nouveau CALL_SUBR_ACTIVE errors using =
dma_bits=3D32 kernel on NV34">[details]</a></span>
nouveau CALL_SUBR_ACTIVE errors using dma_bits=3D32 kernel on NV34

I tried your suggestion about setting dma_bits to 32 inside
drivers/gpu/drm/nouveau/core/subdev/vm/nv44.c.
but sadly the same issue arises (dmesg attached).
I hope I'm still wise to post those traces (from my NV34) in this bug report
and hope the root cause is common.
I currently use the drm kernel module with debug=3D2, debug=3D3 dumps too m=
uch
output, but let me know if this can provide additional useful info.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1354297361.Cb76264.19921--

--===============0183044190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0183044190==--
