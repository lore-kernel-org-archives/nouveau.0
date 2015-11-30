From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92892] [NVA8] KDE Plasma locks up: Nouveau reports
 error "resource sanity check" "unable to handle kernel paging request"
Date: Mon, 30 Nov 2015 11:19:13 +0000
Message-ID: <bug-92892-8800-FxON7qgG2r@http.bugs.freedesktop.org/>
References: <bug-92892-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2035067270=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92892-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2035067270==
Content-Type: multipart/alternative; boundary="1448882353.f2E1f1.23020"; charset="UTF-8"


--1448882353.f2E1f1.23020
Date: Mon, 30 Nov 2015 11:19:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92892

--- Comment #7 from Volker Lukas <vlukas-Mmb7MZpHnFY@public.gmane.org> ---
I used git bisect to find the first bad kernel revision. This is Gits
"BISECT_LOG":

git bisect start
# good: [1c02865136fee1d10d434dc9e3616c8e39905e9b] Linux 4.2.6
git bisect good 1c02865136fee1d10d434dc9e3616c8e39905e9b
# bad: [6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f] Linux 4.3-rc1
git bisect bad 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f
# good: [64291f7db5bd8150a74ad2036f1037e6a0428df2] Linux 4.2
git bisect good 64291f7db5bd8150a74ad2036f1037e6a0428df2
# good: [dd5cdb48edfd34401799056a9acf61078d773f90] Merge
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next
git bisect good dd5cdb48edfd34401799056a9acf61078d773f90
# bad: [f377ea88b862bf7151be96d276f4cb740f8e1c41] Merge branch 'drm-next' of
git://people.freedesktop.org/~airlied/linux
git bisect bad f377ea88b862bf7151be96d276f4cb740f8e1c41
# good: [abebcdfb64f1b39eeeb14282d9cd4aad1ed86f8d] Merge tag 'sound-4.3-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
git bisect good abebcdfb64f1b39eeeb14282d9cd4aad1ed86f8d
# good: [bef2c7bd578e91c9c10983e0c15c4501127b77ca] Merge tag
'drm/tegra/for-4.3-rc1' of git://anongit.freedesktop.org/tegra/linux into
drm-next
git bisect good bef2c7bd578e91c9c10983e0c15c4501127b77ca
# good: [99336ed363f49f484b4d93600c4dfec1f2ebb84a] drm/nouveau/ltc: switch to
device pri macros
git bisect good 99336ed363f49f484b4d93600c4dfec1f2ebb84a
# bad: [97070f23c60869830039b216ff88230f54ef7107] drm/nouveau/pm: convert to
new-style nvkm_engine
git bisect bad 97070f23c60869830039b216ff88230f54ef7107
# good: [c813d8e048740ca82b88a9d3f639bbd8095b24ac] drm/nouveau/bin: punt
client/device argument handling into a common helper
git bisect good c813d8e048740ca82b88a9d3f639bbd8095b24ac
# bad: [6157091177102638c7d94ffc159c0b157a1c9b56] drm/nouveau/sw: remove
dependence on namedb/engctx lookup
git bisect bad 6157091177102638c7d94ffc159c0b157a1c9b56
# good: [168c2e213d3a9b605856d3676d9e93733c8b37d3] drm/nouveau/engine:
implement support for new-style nvkm_engine
git bisect good 168c2e213d3a9b605856d3676d9e93733c8b37d3
# good: [358ce601ae5de59bf6f08f79455c5b3cb7d359d4] drm/nouveau/fifo: directly
use instmem for runlists and polling areas
git bisect good 358ce601ae5de59bf6f08f79455c5b3cb7d359d4
# bad: [344c2d429dd86b1b0113177e18f15adb74e9d936] drm/nouveau/fb: remove
dependence on namedb/engctx lookup
git bisect bad 344c2d429dd86b1b0113177e18f15adb74e9d936
# bad: [1d2a1e53865266a67fb569705eba3ec992682721] drm/nouveau/ramht: remove
dependence on namedb
git bisect bad 1d2a1e53865266a67fb569705eba3ec992682721
# good: [f027f49166171c98d5945af12ac3ee9bc9f9bf4c] drm/nouveau/gpuobj: separate
allocation from nvkm_object
git bisect good f027f49166171c98d5945af12ac3ee9bc9f9bf4c
# first bad commit: [1d2a1e53865266a67fb569705eba3ec992682721]
drm/nouveau/ramht: remove dependence on namedb

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1448882353.f2E1f1.23020
Date: Mon, 30 Nov 2015 11:19:13 +0000
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
   title="NEW - [NVA8] KDE Plasma locks up: Nouveau reports error &quot;resource sanity check&quot; &quot;unable to handle kernel paging request&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92892#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA8] KDE Plasma locks up: Nouveau reports error &quot;resource sanity check&quot; &quot;unable to handle kernel paging request&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92892">bug 92892</a>
              from <span class="vcard"><a class="email" href="mailto:vlukas&#64;gmx.de" title="Volker Lukas &lt;vlukas&#64;gmx.de&gt;"> <span class="fn">Volker Lukas</span></a>
</span></b>
        <pre>I used git bisect to find the first bad kernel revision. This is Gits
&quot;BISECT_LOG&quot;:

git bisect start
# good: [1c02865136fee1d10d434dc9e3616c8e39905e9b] Linux 4.2.6
git bisect good 1c02865136fee1d10d434dc9e3616c8e39905e9b
# bad: [6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f] Linux 4.3-rc1
git bisect bad 6ff33f3902c3b1c5d0db6b1e2c70b6d76fba357f
# good: [64291f7db5bd8150a74ad2036f1037e6a0428df2] Linux 4.2
git bisect good 64291f7db5bd8150a74ad2036f1037e6a0428df2
# good: [dd5cdb48edfd34401799056a9acf61078d773f90] Merge
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next
git bisect good dd5cdb48edfd34401799056a9acf61078d773f90
# bad: [f377ea88b862bf7151be96d276f4cb740f8e1c41] Merge branch 'drm-next' of
git://people.freedesktop.org/~airlied/linux
git bisect bad f377ea88b862bf7151be96d276f4cb740f8e1c41
# good: [abebcdfb64f1b39eeeb14282d9cd4aad1ed86f8d] Merge tag 'sound-4.3-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
git bisect good abebcdfb64f1b39eeeb14282d9cd4aad1ed86f8d
# good: [bef2c7bd578e91c9c10983e0c15c4501127b77ca] Merge tag
'drm/tegra/for-4.3-rc1' of git://anongit.freedesktop.org/tegra/linux into
drm-next
git bisect good bef2c7bd578e91c9c10983e0c15c4501127b77ca
# good: [99336ed363f49f484b4d93600c4dfec1f2ebb84a] drm/nouveau/ltc: switch to
device pri macros
git bisect good 99336ed363f49f484b4d93600c4dfec1f2ebb84a
# bad: [97070f23c60869830039b216ff88230f54ef7107] drm/nouveau/pm: convert to
new-style nvkm_engine
git bisect bad 97070f23c60869830039b216ff88230f54ef7107
# good: [c813d8e048740ca82b88a9d3f639bbd8095b24ac] drm/nouveau/bin: punt
client/device argument handling into a common helper
git bisect good c813d8e048740ca82b88a9d3f639bbd8095b24ac
# bad: [6157091177102638c7d94ffc159c0b157a1c9b56] drm/nouveau/sw: remove
dependence on namedb/engctx lookup
git bisect bad 6157091177102638c7d94ffc159c0b157a1c9b56
# good: [168c2e213d3a9b605856d3676d9e93733c8b37d3] drm/nouveau/engine:
implement support for new-style nvkm_engine
git bisect good 168c2e213d3a9b605856d3676d9e93733c8b37d3
# good: [358ce601ae5de59bf6f08f79455c5b3cb7d359d4] drm/nouveau/fifo: directly
use instmem for runlists and polling areas
git bisect good 358ce601ae5de59bf6f08f79455c5b3cb7d359d4
# bad: [344c2d429dd86b1b0113177e18f15adb74e9d936] drm/nouveau/fb: remove
dependence on namedb/engctx lookup
git bisect bad 344c2d429dd86b1b0113177e18f15adb74e9d936
# bad: [1d2a1e53865266a67fb569705eba3ec992682721] drm/nouveau/ramht: remove
dependence on namedb
git bisect bad 1d2a1e53865266a67fb569705eba3ec992682721
# good: [f027f49166171c98d5945af12ac3ee9bc9f9bf4c] drm/nouveau/gpuobj: separate
allocation from nvkm_object
git bisect good f027f49166171c98d5945af12ac3ee9bc9f9bf4c
# first bad commit: [1d2a1e53865266a67fb569705eba3ec992682721]
drm/nouveau/ramht: remove dependence on namedb</pre>
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

--1448882353.f2E1f1.23020--

--===============2035067270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2035067270==--
