From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89969] vaDriverInit fails with gallium/nouveau driver
Date: Fri, 24 Jul 2015 20:11:46 +0000
Message-ID: <bug-89969-8800-4R3AjkTLLH@http.bugs.freedesktop.org/>
References: <bug-89969-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0480394332=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89969-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0480394332==
Content-Type: multipart/alternative; boundary="1437768706.D3f74b4f2.6025"; charset="UTF-8"


--1437768706.D3f74b4f2.6025
Date: Fri, 24 Jul 2015 20:11:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89969

Julien Isorce <julien.isorce-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #117215|0                           |1
        is obsolete|                            |

--- Comment #12 from Julien Isorce <julien.isorce-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 117358
  --> https://bugs.freedesktop.org/attachment.cgi?id=117358&action=edit
WIP - nouveau: add support for chunk decoding

I updated patch since I miss understood some parts last time.
Preserving data while resizing is commented out for testing since the initial
buffer is big enough for the stream I tried.
The patch keeps st/vdpau working but st/va still does not work.
Indeed it shows a green frame. I do not see any shape but I see some pixels
that let me think it does something.

How can I be sure it is not a problem from st/va ? I assume it works with
radeon (only radeon for now ? according to src/gallium/targets/va/Makefile.am I
was expecting intel too)
For nouveau, maybe it requires to do more work on st/va side.
I can try to go for the other solution to compare.

Which internal or external unit tests can I use ? Also if you have an idea how
I can debug this ?

Maybe I can compare what contains the nouveau_bo buffer between one begin/end,
between vdpau and va ? Not sure if they should contain the exact same thing at
the time _end is called.

Thx

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1437768706.D3f74b4f2.6025
Date: Fri, 24 Jul 2015 20:11:46 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:julien.isorce&#64;gmail.com" title="Julien Isorce &lt;julien.isorce&#64;gmail.com&gt;"> <span class="fn">Julien Isorce</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - vaDriverInit fails with gallium/nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89969">bug 89969</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Attachment #117215 is obsolete</td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - vaDriverInit fails with gallium/nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89969#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - vaDriverInit fails with gallium/nouveau driver"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89969">bug 89969</a>
              from <span class="vcard"><a class="email" href="mailto:julien.isorce&#64;gmail.com" title="Julien Isorce &lt;julien.isorce&#64;gmail.com&gt;"> <span class="fn">Julien Isorce</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=117358" name="attach_117358" title="WIP - nouveau: add support for chunk decoding">attachment 117358</a> <a href="attachment.cgi?id=117358&amp;action=edit" title="WIP - nouveau: add support for chunk decoding">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=89969&amp;attachment=117358'>[review]</a>
WIP - nouveau: add support for chunk decoding

I updated patch since I miss understood some parts last time.
Preserving data while resizing is commented out for testing since the initial
buffer is big enough for the stream I tried.
The patch keeps st/vdpau working but st/va still does not work.
Indeed it shows a green frame. I do not see any shape but I see some pixels
that let me think it does something.

How can I be sure it is not a problem from st/va ? I assume it works with
radeon (only radeon for now ? according to src/gallium/targets/va/Makefile.am I
was expecting intel too)
For nouveau, maybe it requires to do more work on st/va side.
I can try to go for the other solution to compare.

Which internal or external unit tests can I use ? Also if you have an idea how
I can debug this ?

Maybe I can compare what contains the nouveau_bo buffer between one begin/end,
between vdpau and va ? Not sure if they should contain the exact same thing at
the time _end is called.

Thx</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1437768706.D3f74b4f2.6025--

--===============0480394332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0480394332==--
