From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93458] page allocation failure: order:5,
	mode:0x240c0c0
Date: Sat, 16 Jan 2016 11:24:55 +0000
Message-ID: <bug-93458-8800-XZ2NNcK1tn@http.bugs.freedesktop.org/>
References: <bug-93458-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1926780259=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93458-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1926780259==
Content-Type: multipart/alternative; boundary="1452943495.D811032.16409"; charset="UTF-8"


--1452943495.D811032.16409
Date: Sat, 16 Jan 2016 11:24:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93458

--- Comment #4 from Zlatko Calusic <zcalusic-7aYyyD3GOf7R7s880joybQ@public.gmane.org> ---
Created attachment 121071
  --> https://bugs.freedesktop.org/attachment.cgi?id=121071&action=edit
Use vzalloc instad of kzalloc in nvkm_ramht_new()

I've had lots of success using the attached patch. 4 days and still running
strong, no page allocation failures. But, some core developer should probably
confirm that using vmalloc instead of kmalloc is ok in that function.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1452943495.D811032.16409
Date: Sat, 16 Jan 2016 11:24:55 +0000
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
   title="NEW - page allocation failure: order:5, mode:0x240c0c0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93458#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - page allocation failure: order:5, mode:0x240c0c0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93458">bug 93458</a>
              from <span class="vcard"><a class="email" href="mailto:zcalusic&#64;bitsync.net" title="Zlatko Calusic &lt;zcalusic&#64;bitsync.net&gt;"> <span class="fn">Zlatko Calusic</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=121071" name="attach_121071" title="Use vzalloc instad of kzalloc in nvkm_ramht_new()">attachment 121071</a> <a href="attachment.cgi?id=121071&amp;action=edit" title="Use vzalloc instad of kzalloc in nvkm_ramht_new()">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=93458&amp;attachment=121071'>[review]</a>
Use vzalloc instad of kzalloc in nvkm_ramht_new()

I've had lots of success using the attached patch. 4 days and still running
strong, no page allocation failures. But, some core developer should probably
confirm that using vmalloc instead of kmalloc is ok in that function.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1452943495.D811032.16409--

--===============1926780259==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1926780259==--
