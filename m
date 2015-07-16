From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91355] [NV108] Quadro K610M: nouveau fills the
 kernel log when a video is played
Date: Thu, 16 Jul 2015 00:26:58 +0000
Message-ID: <bug-91355-8800-kfXon8tPVi@http.bugs.freedesktop.org/>
References: <bug-91355-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1961849559=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91355-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1961849559==
Content-Type: multipart/alternative; boundary="1437006418.a4B2F4B31.11355"; charset="UTF-8"


--1437006418.a4B2F4B31.11355
Date: Thu, 16 Jul 2015 00:26:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91355

Vincent Lefevre <vincent-fdt-buymaDBGzMOsTnJN9+BGXg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[Quadro K610M] nouveau      |[NV108] Quadro K610M:
                   |fills the kernel log when a |nouveau fills the kernel
                   |video is played             |log when a video is played

--- Comment #3 from Vincent Lefevre <vincent-fdt-buymaDBGzMOsTnJN9+BGXg@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #2)
> v3.16 was released almost a year ago. Does this happen on a more recent
> kernel?

I can't test: nouveau fails completely with a 4.0.5 or 4.7 kernel (available in
Debian). I suspect that this is bug 89047 (similar error messages), according
to:
https://bugs.freedesktop.org/show_bug.cgi?id=89047#c1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1437006418.a4B2F4B31.11355
Date: Thu, 16 Jul 2015 00:26:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:vincent-fdt&#64;vinc17.net" title="Vincent Lefevre &lt;vincent-fdt&#64;vinc17.net&gt;"> <span class="fn">Vincent Lefevre</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV108] Quadro K610M: nouveau fills the kernel log when a video is played"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91355">bug 91355</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[Quadro K610M] nouveau fills the kernel log when a video is played
           </td>
           <td>[NV108] Quadro K610M: nouveau fills the kernel log when a video is played
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV108] Quadro K610M: nouveau fills the kernel log when a video is played"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91355#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV108] Quadro K610M: nouveau fills the kernel log when a video is played"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91355">bug 91355</a>
              from <span class="vcard"><a class="email" href="mailto:vincent-fdt&#64;vinc17.net" title="Vincent Lefevre &lt;vincent-fdt&#64;vinc17.net&gt;"> <span class="fn">Vincent Lefevre</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=91355#c2">comment #2</a>)
<span class="quote">&gt; v3.16 was released almost a year ago. Does this happen on a more recent
&gt; kernel?</span >

I can't test: nouveau fails completely with a 4.0.5 or 4.7 kernel (available in
Debian). I suspect that this is <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - linux-3.19 nvd9 Invalid rom content"
   href="show_bug.cgi?id=89047">bug 89047</a> (similar error messages), according
to:
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - linux-3.19 nvd9 Invalid rom content"
   href="show_bug.cgi?id=89047#c1">https://bugs.freedesktop.org/show_bug.cgi?id=89047#c1</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1437006418.a4B2F4B31.11355--

--===============1961849559==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1961849559==--
