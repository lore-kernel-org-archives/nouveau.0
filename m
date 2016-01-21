From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28M)
Date: Thu, 21 Jan 2016 12:20:07 +0000
Message-ID: <bug-54700-8800-hVydlUX22i@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1273374749=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1273374749==
Content-Type: multipart/alternative; boundary="14533788071.411A0E6F1.3001";
 charset="UTF-8"


--14533788071.411A0E6F1.3001
Date: Thu, 21 Jan 2016 12:20:07 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=54700

AndrewK <kurn-z1KUqvL5UUQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kurn-z1KUqvL5UUQ@public.gmane.org

--- Comment #73 from AndrewK <kurn-z1KUqvL5UUQ@public.gmane.org> ---
(In reply to nv28m from comment #71)
> nouveau.agpmode=0 seems to work here too, also after comming back from
> suspend.
> 
> Still I think I'm stuck with the modesetting driver with the bit 24 hack in
> boot/suspend scripts. The scrolling and rxvt performance is just better.

The parameter name seems to be changed.  nouveau.modeset=0 is what worked for
me.

I add my thanks for the hard work done by Mr. nv28m.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14533788071.411A0E6F1.3001
Date: Thu, 21 Jan 2016 12:20:07 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:kurn&#64;sfu.ca" title="AndrewK &lt;kurn&#64;sfu.ca&gt;"> <span class="fn">AndrewK</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Distorted graphics (double cursor) with GeForce 4200Go (NV28M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
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
           <td>kurn&#64;sfu.ca
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Distorted graphics (double cursor) with GeForce 4200Go (NV28M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c73">Comment # 73</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Distorted graphics (double cursor) with GeForce 4200Go (NV28M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:kurn&#64;sfu.ca" title="AndrewK &lt;kurn&#64;sfu.ca&gt;"> <span class="fn">AndrewK</span></a>
</span></b>
        <pre>(In reply to nv28m from <a href="show_bug.cgi?id=54700#c71">comment #71</a>)
<span class="quote">&gt; nouveau.agpmode=0 seems to work here too, also after comming back from
&gt; suspend.
&gt; 
&gt; Still I think I'm stuck with the modesetting driver with the bit 24 hack in
&gt; boot/suspend scripts. The scrolling and rxvt performance is just better.</span >

The parameter name seems to be changed.  nouveau.modeset=0 is what worked for
me.

I add my thanks for the hard work done by Mr. nv28m.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14533788071.411A0E6F1.3001--

--===============1273374749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1273374749==--
