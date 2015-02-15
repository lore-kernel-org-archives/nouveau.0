From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71455] Thermal management in nouveau running hot
	3.12.0+ kernel
Date: Sun, 15 Feb 2015 02:51:23 +0000
Message-ID: <bug-71455-8800-iGqqxhAKIA@http.bugs.freedesktop.org/>
References: <bug-71455-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0738295825=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71455-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0738295825==
Content-Type: multipart/alternative; boundary="1423968685.02D6DBE2.28575"; charset="UTF-8"


--1423968685.02D6DBE2.28575
Date: Sun, 15 Feb 2015 02:51:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71455

Evan Foss <evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #7 from Evan Foss <evanfoss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 113500
  --> https://bugs.freedesktop.org/attachment.cgi?id=113500&action=edit
dmesg text

I am running a mid 2012 macbook pro. 650M nVidia chip. There is something funky
with the glx rendering. I tried the various things in the troubleshooting guide
and got no where. If need be I can email the following two images to the list
but I thought I would save everyones mailboxes some bloat. 

https://www.flickr.com/photos/evanfoss/15912299653/
https://www.flickr.com/photos/evanfoss/16507165346/in/photostream/

For those in the far future who may find the above links dead the images show
glxgears rendering at +3K frames a second. The glxgears window however has
blocks missing with only a single pixel in each one being rendered.

I have tested the following kernel versions and found this to be true for all
of the following. 

gentoo-sources-3.12.13
gentoo-sources-3.14.6
gentoo-sources-3.16.1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1423968685.02D6DBE2.28575
Date: Sun, 15 Feb 2015 02:51:25 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:evanfoss&#64;gmail.com" title="Evan Foss &lt;evanfoss&#64;gmail.com&gt;"> <span class="fn">Evan Foss</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Thermal management in nouveau running hot 3.12.0+ kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71455">bug 71455</a>
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
           <td>evanfoss&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Thermal management in nouveau running hot 3.12.0+ kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71455#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Thermal management in nouveau running hot 3.12.0+ kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71455">bug 71455</a>
              from <span class="vcard"><a class="email" href="mailto:evanfoss&#64;gmail.com" title="Evan Foss &lt;evanfoss&#64;gmail.com&gt;"> <span class="fn">Evan Foss</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=113500" name="attach_113500" title="dmesg text">attachment 113500</a> <a href="attachment.cgi?id=113500&amp;action=edit" title="dmesg text">[details]</a></span>
dmesg text

I am running a mid 2012 macbook pro. 650M nVidia chip. There is something funky
with the glx rendering. I tried the various things in the troubleshooting guide
and got no where. If need be I can email the following two images to the list
but I thought I would save everyones mailboxes some bloat. 

<a href="https://www.flickr.com/photos/evanfoss/15912299653/">https://www.flickr.com/photos/evanfoss/15912299653/</a>
<a href="https://www.flickr.com/photos/evanfoss/16507165346/in/photostream/">https://www.flickr.com/photos/evanfoss/16507165346/in/photostream/</a>

For those in the far future who may find the above links dead the images show
glxgears rendering at +3K frames a second. The glxgears window however has
blocks missing with only a single pixel in each one being rendered.

I have tested the following kernel versions and found this to be true for all
of the following. 

gentoo-sources-3.12.13
gentoo-sources-3.14.6
gentoo-sources-3.16.1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1423968685.02D6DBE2.28575--

--===============0738295825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0738295825==--
