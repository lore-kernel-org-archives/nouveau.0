From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82714] [G84] nouveau fails to properly initialize GPU
Date: Sat, 04 Apr 2015 12:50:32 +0000
Message-ID: <bug-82714-8800-9DIvjtNFqK@http.bugs.freedesktop.org/>
References: <bug-82714-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0480016937=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82714-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0480016937==
Content-Type: multipart/alternative; boundary="1428151832.4C17D2.16465"; charset="UTF-8"


--1428151832.4C17D2.16465
Date: Sat, 4 Apr 2015 12:50:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82714

Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |ASSIGNED

--- Comment #12 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Closing my own bug request as it duplicates this one.

I wish I knew which engine to blame as it would make debugging so much easier;
all the obvious ones don't seem to be responsible!

(In reply to Bruno from comment #10)
> That would mean that nvif_rd32(&dmac->base.user, 0x0000) returns 0xffffffff.
> That value looks rather "non-initialized" and GPU's PCI bar surly is not 4GB
> large.

Nouveau first configures some parameters on the EVO Core channel, and the
returned DMAC put pointer is valid at that time. Same goes when it configures
some flip stuff on the EVO Base channel. However, as soon as it pushes the flip
stuff, the next returned DMAC put pointer is garbage.
Iirc, when I commented the whole content of the nv50_display_flip_stop, the
crash occured just after kicking the result of nv50_display_flip_next. So most
likely something related to flipping but I have no idea what is needed for
flipping to work.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1428151832.4C17D2.16465
Date: Sat, 4 Apr 2015 12:50:32 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714">bug 82714</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>REOPENED
           </td>
           <td>ASSIGNED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_ASSIGNED "
   title="ASSIGNED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714">bug 82714</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>Closing my own bug request as it duplicates this one.

I wish I knew which engine to blame as it would make debugging so much easier;
all the obvious ones don't seem to be responsible!

(In reply to Bruno from <a href="show_bug.cgi?id=82714#c10">comment #10</a>)
<span class="quote">&gt; That would mean that nvif_rd32(&amp;dmac-&gt;base.user, 0x0000) returns 0xffffffff.
&gt; That value looks rather &quot;non-initialized&quot; and GPU's PCI bar surly is not 4GB
&gt; large.</span >

Nouveau first configures some parameters on the EVO Core channel, and the
returned DMAC put pointer is valid at that time. Same goes when it configures
some flip stuff on the EVO Base channel. However, as soon as it pushes the flip
stuff, the next returned DMAC put pointer is garbage.
Iirc, when I commented the whole content of the nv50_display_flip_stop, the
crash occured just after kicking the result of nv50_display_flip_next. So most
likely something related to flipping but I have no idea what is needed for
flipping to work.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1428151832.4C17D2.16465--

--===============0480016937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0480016937==--
