From: Marc Rios <marcrios84-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nvidia GT450M
Date: Fri, 22 Apr 2011 20:35:13 +0200
Message-ID: <BANLkTimCpHxgdraqqmBtxdgLWhx6AwE9HQ@mail.gmail.com>
References: <BANLkTinPx2y-7YZxg6amLvVsaPgaVY2x5w@mail.gmail.com>
	<1303165988.3453.0.camel@nisroch>
	<BANLkTikgjUfmtAHUqs08cT=G7koGTvW21Q@mail.gmail.com>
	<1303210694.6174.0.camel@nisroch>
	<BANLkTimgbhCdKZB8HdpOTcMaNxxOpOCE-A@mail.gmail.com>
	<BANLkTi=6eP_mF7fg9Xre5FA8WU4ouRjVgg@mail.gmail.com>
	<20110422213143.2957ed15@farn.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1007439662=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20110422213143.2957ed15-DA5HUFbJnAM@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1007439662==
Content-Type: multipart/alternative; boundary=0016364c7b3f5523e804a1861ec5

--0016364c7b3f5523e804a1861ec5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi, i think this is because on boot, the framebuffer is for the intel card,
not nvidia... but the problem on config it's there. Tomorrow I send you ful=
l
if you want... this system is an intel and nvidia.
El 22/04/2011 20:31, "Pekka Paalanen" <pq-X3B1VOXEql0@public.gmane.org> escribi=C3=B3:
> On Fri, 22 Apr 2011 18:32:51 +0200
> Marc Rios <marcrios84-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
>> Hi,
>>
>> Here you have:
>
> <snip>
>
> From your paste:
> [ 11.819386] fb1: nouveaufb frame buffer device
>
> This means nouveaufb is fb1, while fbcon by default is in fb0.
> That is, fbcon is not using nouveaufb, but another driver that
> was loaded before nouveau. Unfortunately we cannot see what
> happened, because you did not include the full dmesg.
> Full really means full, from boot, up to and including the
> problem, not filtered in any way.
>
> I hope other people will see this reply and really post a full
> dmesg when asked to. It is also instructed in
> http://nouveau.freedesktop.org/wiki/Bugs
>
> Thanks.
>
>> > On Tue, Apr 19, 2011 at 12:58 PM, Ben Skeggs
>> > <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> >
>> >> Not to you having a black screen, no. Can you post your
>> >> *full* dmesg output after you've tried to load nouveau?
>> >>
>> >> Ben.
>
> --
> Pekka Paalanen
> http://www.iki.fi/pq/
>

--0016364c7b3f5523e804a1861ec5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p>Hi, i think this is because on boot, the framebuffer is for the intel ca=
rd, not nvidia... but the problem on config it&#39;s there. Tomorrow I send=
 you full if you want... this system is an intel and nvidia. </p>
<div class=3D"gmail_quote">El 22/04/2011 20:31, &quot;Pekka Paalanen&quot; =
&lt;<a href=3D"mailto:pq-X3B1VOXEql0@public.gmane.org">pq-X3B1VOXEql0@public.gmane.org</a>&gt; escribi=C3=B3:<br type=
=3D"attribution">&gt; On Fri, 22 Apr 2011 18:32:51 +0200<br>&gt; Marc Rios =
&lt;<a href=3D"mailto:marcrios84-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">marcrios84-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wr=
ote:<br>
&gt; <br>&gt;&gt; Hi,<br>&gt;&gt; <br>&gt;&gt; Here you have:<br>&gt; <br>&=
gt; &lt;snip&gt;<br>&gt; <br>&gt; From your paste:<br>&gt; [   11.819386] f=
b1: nouveaufb frame buffer device<br>&gt; <br>&gt; This means nouveaufb is =
fb1, while fbcon by default is in fb0.<br>
&gt; That is, fbcon is not using nouveaufb, but another driver that<br>&gt;=
 was loaded before nouveau. Unfortunately we cannot see what<br>&gt; happen=
ed, because you did not include the full dmesg.<br>&gt; Full really means f=
ull, from boot, up to and including the<br>
&gt; problem, not filtered in any way.<br>&gt; <br>&gt; I hope other people=
 will see this reply and really post a full<br>&gt; dmesg when asked to. It=
 is also instructed in<br>&gt; <a href=3D"http://nouveau.freedesktop.org/wi=
ki/Bugs">http://nouveau.freedesktop.org/wiki/Bugs</a><br>
&gt; <br>&gt; Thanks.<br>&gt; <br>&gt;&gt; &gt; On Tue, Apr 19, 2011 at 12:=
58 PM, Ben Skeggs<br>&gt;&gt; &gt; &lt;<a href=3D"mailto:skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org"=
>skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br>&gt;&gt; &gt;<br>&gt;&gt; &gt;&gt; Not=
 to you having a black screen, no.  Can you post your<br>
&gt;&gt; &gt;&gt; *full* dmesg output after you&#39;ve tried to load nouvea=
u?<br>&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt; Ben.<br>&gt; <br>&gt; -- <br>&=
gt; Pekka Paalanen<br>&gt; <a href=3D"http://www.iki.fi/pq/">http://www.iki=
.fi/pq/</a><br>
&gt; <br></div>

--0016364c7b3f5523e804a1861ec5--

--===============1007439662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1007439662==--
