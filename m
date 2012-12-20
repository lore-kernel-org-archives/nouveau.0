From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: reproducible CACHE_ERRORS
Date: Thu, 20 Dec 2012 23:59:27 +0100
Message-ID: <20121220225927.GA3496@joi.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="OXfL5xGRrasGEqWY"
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

I found a way to reliably reproduce PFIFO CACHE_ERRORS, but I don't see why.

How to reproduce them:
1) Run a couple of glxinfo loops - 3 is usually enough.
   while [ true ]; do nvgl glxinfo >/dev/null 2>/dev/null; done
2) Run glxgears.
3) If you can't see it now, resize glxgears window or add more glxinfos.
Note: you need at least 2 CPUs.

Usually the error looks like this (with a bit improved logging):
nouveau E[   PFIFO][0000:02:00.0] CACHE_ERROR - ch 6 [glxgears[15559]] subc 0 mthd 0x0060 data 0x8000000f c1p0 0x20000010 HASH_FAILED (unknown bits 0x20000000) c1_hash 0x00000436

What I found so far:
1) It's triggered by setting of NV11_SUBCHAN_DMA_SEMAPHORE to NvSema
   (0x8000000f) in nv84_fence_emit. Hw tells us it cannot find ramht entry
   for NvSema object (NV04_PFIFO_CACHE1_PULL0 == HASH_FAILED, frequently
   unknown 30th bit is set)
2) In 95% cases CACHE_ERRORs are triggered on glxgears channel.
3) RAMHT entry was definitely created and used many times before reporting
   an error. Next use of NvSema usually does NOT trigger another CACHE_ERROR.
4) NV04_PFIFO_CACHE1_HASH has the same value as was written to ramht.
5) I can replace glxinfo loops with application which creates and destroys
   PGRAPH objects. PCRYPT, PMPEG and SW objects do NOT provoke this bug.
   (program attached)
6) There are no interrupts between CACHE_ERRORs, so it's not caused by race in
   cache_error/software method handling.

Any ideas how to debug it?

Marcin

--OXfL5xGRrasGEqWY
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="test_objects.tar.gz"
Content-Transfer-Encoding: base64

H4sIAJiW01ACA+1Ze0/jSBLnX/wpatgVSpADTggwM+yMxpM4xNoQc7YzgPZWWcdux14St8d2
eOxqPtB9g/v77otdVdt5AzPS3SCtLi2E2+WqXz26uvqRjKVZnw9+Z26WHmx9n6ZgOzk6omf1
5EgpnjVBL9pWtaYc10+qh9Xq8ZZSPVSQHY62XqBN0sxJALbGTuKG0dN8X/v+F23Z4vgvvuy7
/9PxP67Xnxr/2mF9Pv5KHenVoxPleAuUzfh/9/ZDGLmjicfgpzTzQr4fvJeWSKNwsEJ7wDx5
iFm6TsZIZstU342y0TLJJWEiLdAiPrllzmSZsSD2vWS8zL7jJWGt70yyYD/YkaQwymDshFGJ
Ok4ydGVwAxzSPezf/vJrWfpT2qZPvncqbadZMnEzmGGz29BlsIdPeAfdXqezzuOOQobie8Xz
KbZ82iBb4EQy7OHrAs+tUu/7oc/znudkDuL8Cfu3iTPGnnI/YMxXakpVhv2hk2SLtBp8OZWk
bd9DIo9ZVNo5QHMPMAgHrpN4yo4MRt9sXpplVBj6UELOn0ApA/q9HbMk4UlphwR3iGE7Ydkk
iaCK/S9SLjCLJ4qWy0s8OcNyuPp3iRMjqwxo7i7Sysu6HuF+UvVy9PoRuysRYuV9TpBBkaFr
9D5paq/f0ltGv9FWu12t0290VMuSEXR7dxZTGdLwD8b90oxSRgNpQJ6wcK71qwbmoy8MRPsI
VhCeAJ5zPwp8F4QjBiVMDpbLHxwIgPSt6Cv3inKoQAXiIcYuKGhHSs1bpx2+Wae5a7Kva29O
5jRBjDgs6zypu1XkcZOHOJuJndSRNI7ZcAZ+zJCS3hHIEwOYz4Aif7FRnwyQxcwRQ7qL7EXo
nhkUqOXRWwwfxm97e4XVY6OSQCzCW7Arp9IXaWvTvn39P3dumI+p+R32f8+s/1Xl8GS6/teO
j5CvWj+q1Tfr/0u0RqujnlnvKkOo4Gr/zn2D9eTSGY3gt/hmWHF55If4qeL6I2eYAu4GcDnu
F/MP7qtVuGf32W9Sp5njLEsh+zMy0mLuvYWlzSeH+SLPYZqX0vYH5gYcIaObMBrCjx+Q8mOp
0SgD/hcWUK8wpvwcZIUvfV02Zp+vmOMuyAZr5gwm4chbsafiLpi0jCVJC4a8XUD+L7UsAEmS
O2JO9HYqK95QFt+TMVT85yKzFJZNgfx/qv8LGfSC9f+4dlIV9f+wXq2fHCt0/qtWa5v6/xLt
YE+CPWjw+CEJh0EG//oH1BTlNZjMg7aDG3A9cveRhbguWDIO0zTkEYQpBCxhgwfALWWUMTwM
+AljwH1x+BoyGTIOTvQAuL1LUYAPMjyjUflyCMpFhcScBYiUcj+7cxKG/B44acrd0EFI8Lg7
GeM+2slIJdXCFDfNAZ4ALZSoEA6J7ZSFMo85IwgjIAZringXZgGfZJBgmiehS0Ay5AdJsqX4
TEijcBwWmghBRCMl3EmKzpC9Moy5F/r0ZMLDeDIYhWkggxcS+mCSMZmg0I0DnkDKcBlFwRDN
Fq7O7ZKFqwgeU0izIkhC3V3Ax8RLQDM3MEg+bmlRGRNiHsegoQEJvw09IgVOJhQ4A37LhLXC
AQKJeIbHsFJaznVSwOP5QOZfwYljhtMAw+c8avQs2AUIqhvwLHhM5/MK5xYt6EwnccyTjEZk
acyniWe3NbCMln2pmhroFlyYxie9qTVhR7XwHU/Al7rdNno2IIepdu1rMFqgdq/hZ73blEG7
ujA1yyIowwT9/KKja0jWu41Or6l3z+AjinYNGzr6uW4jrm0InQWarlmEd66ZdPq01Y96R8RD
t69laOl2F7GhhcgqXKimrTd6HdWEi555YVgamtFE7K7ebZmoSjvXujah2W3dbAr+a8Iy9bO2
be2jTcgM2ifistpqpyMMaRgX14ID2kanqZnkRt6zCi/QaL2bxwoDhL7oDQ0+auiR+rGj5dZh
PPDYrJ/LULxZF1pDVzso2dRNrWETvWF0LU2497ceGkGfm+q5eqZZM7HiHS7bqm0ZaKsJGN5e
x6ZQtkzjHDqGJULWszQxI5qqrZI0DhzGC5Eu2xr6ZZK7Kv41bN3okgBqt018xbOidtbRz7Qu
uoGCBnEL9wwMsNGzChkZVFO3SC+NPgIYAhNhuloOSpkhYoi2CBM0E4MhHDxXBXorj9k0waZJ
p927LM6wHmFqR1S8cJ6J8oL5nGewLNI/csai7jkLUyDgI49hBQhwNhUZDwNGpURgON4tw3RP
KeGxUOBEYsldmDJRERI+5hkT0KkzQiUohVwEIxhFoUPJdGbNWrWLkxBh75IwyxhqwwWdJ+Ef
eXHjPiER+qq5U8dVwZ++pT7AzwkWt9CJoP3vfw7TAVY+KN0kwYeEeVgF9l0+LiPjweJ13lW1
enC1fJknSGt3iVNqGGWPfMBIZHydjmcHFlEpSak7ycLRszy0p5khSc9edxY3jXPCvf/6eJW4
cvtId56hm9840hdtqrmLafHLr/AOmqZe63fVc+10ynw1Y9Ijn8MeyVHvVFrnaHN+ky4j56R3
4vaEblSkL4uCV3YfZ41mqrbWb+HE7jd166KjXkOJDGmFkdcM03jkPODE/HqbmvbNzEv+f5PU
7rpz3ySn5PdJ5ZnvHzkfSeQkJTAuIaGLu4hS4S3mskdL+JXexGkSefwOl208lo6dYej26QYZ
n3RXjMgU/UIsH6CQ/ucjuRDAEgKWT0ngflWryT7DXsI+P/U1Hj3gliTGcSN1mK2NgLk3syCU
hKmkVX4kqNByRikr58Id7t6s2XPGMrSgtKpXRp2fcw7sVN7jP/shZugZqaq8d7nH0sr7sfM7
T/o8ptc5M9lhzgSu+qvgc848vMiUd+YfRIyRLp65+XSF+Kp/JSKSe126z8OzV4ZdipG4L7zP
XaYbw3zwe9HoMcexWQ+R28aNx4iVZrTiQlCACNoXofwJkGUEaS6P1uw7Cy57dMEofn+Y36Dn
vzSIHx3W0utU2p5lI24Z49PZ/fsYR+ycWMS1+m6ejGVpe/FueYHr0UtlQqSRMWIWTX0SE6T4
WeAVMRSYPq4QUeaXsAgiugw7i1LgO7jV9v7+9A8Gr9ZmGWHLYHKeXYpBLwgKbs2XnFlTvIr0
nPLNxe6Lnf+DFzz/K3TYXz3/K4eb8//L/P7rRx7z812K2rPb/XZf+gEpuN9dJj5e6LCG/cAi
PBZvJuSmbdqmbdpfqv0HMkrQbgAoAAA=

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--OXfL5xGRrasGEqWY--
