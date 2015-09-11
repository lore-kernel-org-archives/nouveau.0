From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87436] INVALID_STATE [UNK05] chid 0 mthd 0x0080 data
	0x00000000
Date: Fri, 11 Sep 2015 15:31:30 +0000
Message-ID: <bug-87436-8800-Zdrot78kXl@http.bugs.freedesktop.org/>
References: <bug-87436-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1931263623=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87436-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1931263623==
Content-Type: multipart/alternative; boundary="1441985490.af3A2.28158"; charset="UTF-8"


--1441985490.af3A2.28158
Date: Fri, 11 Sep 2015 15:31:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87436

rcoe-TsGEh1ee8XYAvxtiuMwx3w@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rcoe-TsGEh1ee8XYAvxtiuMwx3w@public.gmane.org

--- Comment #12 from rcoe-TsGEh1ee8XYAvxtiuMwx3w@public.gmane.org ---
I see this issue as well. 
I'm not sure if it's related to the issue I'm having with resuming after
suspend after N resumes.
I've started counting the number of suspend resume cycles.
On the 21st resume, I got this message today.
[997713.432479] nouveau  [     DRM] resuming console...
[997713.432546] nouveau E[   PDISP][0000:01:00.0] INVALID_STATE 
[UNK05] chid 0 mthd 0x0080 data 0x00000000

linux 4.1.4
xf86-video-nouveau-1.0.11-1.3.x86_64
Mesa-10.3.7-91.6.1.x86_64
xorg-x11-server-7.6_1.16.1-19.1.x86_64
VGA compatible controller: NVIDIA Corporation GF108GLM [NVS 5200M] (rev a1)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1441985490.af3A2.28158
Date: Fri, 11 Sep 2015 15:31:30 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:rcoe&#64;wi.rr.com" title="rcoe&#64;wi.rr.com">rcoe&#64;wi.rr.com</a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - INVALID_STATE [UNK05] chid 0 mthd 0x0080 data 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87436">bug 87436</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>rcoe&#64;wi.rr.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - INVALID_STATE [UNK05] chid 0 mthd 0x0080 data 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87436#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - INVALID_STATE [UNK05] chid 0 mthd 0x0080 data 0x00000000"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87436">bug 87436</a>
              from <span class="vcard"><a class="email" href="mailto:rcoe&#64;wi.rr.com" title="rcoe&#64;wi.rr.com">rcoe&#64;wi.rr.com</a>
</span></b>
        <pre>I see this issue as well. 
I'm not sure if it's related to the issue I'm having with resuming after
suspend after N resumes.
I've started counting the number of suspend resume cycles.
On the 21st resume, I got this message today.
[997713.432479] nouveau  [     DRM] resuming console...
[997713.432546] nouveau E[   PDISP][0000:01:00.0] INVALID_STATE 
[UNK05] chid 0 mthd 0x0080 data 0x00000000

linux 4.1.4
xf86-video-nouveau-1.0.11-1.3.x86_64
Mesa-10.3.7-91.6.1.x86_64
xorg-x11-server-7.6_1.16.1-19.1.x86_64
VGA compatible controller: NVIDIA Corporation GF108GLM [NVS 5200M] (rev a1)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1441985490.af3A2.28158--

--===============1931263623==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1931263623==--
