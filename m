From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78863] [NV92] errors when starts gnome-shell -
 INVALID_VALUE class 0x8297 mthd 0x0e04 data 0xfebf0000
Date: Sun, 18 May 2014 16:41:10 +0000
Message-ID: <bug-78863-8800-g3o3zPYlAI@http.bugs.freedesktop.org/>
References: <bug-78863-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0630498219=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78863-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0630498219==
Content-Type: multipart/alternative; boundary="1400431269.F0e11.8992"; charset="us-ascii"


--1400431269.F0e11.8992
Date: Sun, 18 May 2014 16:41:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78863

--- Comment #2 from mattia.b89 <mattia.b89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #1)
> Are there any rendering issues, or just these errors?
> 
> $ lookup -a 92 -d NV01_SUBCHAN -- -v obj-class NV84_3D e04 0xfebf0000
> SCISSOR_HORIZ[0] => { MIN = 0 | MAX = 65215 }
> $ lookup -a 92 -d NV01_SUBCHAN -- -v obj-class NV84_3D e08 0xfebf0000
> SCISSOR_VERT[0] => { MIN = 0 | MAX = 65215 }
> 
> Those indeed appear to be invalid. I thought I had a thing clamping the
> value... What version of mesa are you using?
> 
> Hm, looks like the clamping is missing on the blit_3d path, but that'd only
> be an issue if someone had specified negative scissor bounds... hopefully
> the upper layers disallow that.

probably I have that issue/artifact: sometime, portion of a window isn't drawed
but because simply gray 

mesa-10.1.3-1

I don't have "lookup" command and I don't find how to get it....teach it to me

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1400431269.F0e11.8992
Date: Sun, 18 May 2014 16:41:09 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] errors when starts gnome-shell - INVALID_VALUE class 0x8297 mthd 0x0e04 data 0xfebf0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78863#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV92] errors when starts gnome-shell - INVALID_VALUE class 0x8297 mthd 0x0e04 data 0xfebf0000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78863">bug 78863</a>
              from <span class="vcard"><a class="email" href="mailto:mattia.b89&#64;gmail.com" title="mattia.b89 &lt;mattia.b89&#64;gmail.com&gt;"> <span class="fn">mattia.b89</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=78863#c1">comment #1</a>)
<span class="quote">&gt; Are there any rendering issues, or just these errors?
&gt; 
&gt; $ lookup -a 92 -d NV01_SUBCHAN -- -v obj-class NV84_3D e04 0xfebf0000
&gt; SCISSOR_HORIZ[0] =&gt; { MIN = 0 | MAX = 65215 }
&gt; $ lookup -a 92 -d NV01_SUBCHAN -- -v obj-class NV84_3D e08 0xfebf0000
&gt; SCISSOR_VERT[0] =&gt; { MIN = 0 | MAX = 65215 }
&gt; 
&gt; Those indeed appear to be invalid. I thought I had a thing clamping the
&gt; value... What version of mesa are you using?
&gt; 
&gt; Hm, looks like the clamping is missing on the blit_3d path, but that'd only
&gt; be an issue if someone had specified negative scissor bounds... hopefully
&gt; the upper layers disallow that.</span >

probably I have that issue/artifact: sometime, portion of a window isn't drawed
but because simply gray 

mesa-10.1.3-1

I don't have &quot;lookup&quot; command and I don't find how to get it....teach it to me</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1400431269.F0e11.8992--

--===============0630498219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0630498219==--
