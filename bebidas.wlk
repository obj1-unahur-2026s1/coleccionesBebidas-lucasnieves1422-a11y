object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}

class Licuado {
    const nutrientes = []

    method agregarFruta(nutriente) {
        nutrientes.add(nutriente)
    }

    method rendimiento(cantidad) {
        return nutrientes.sum() * (cantidad / 1000)
    }
}

class AguaSaborizada {
    const bebidaBase

    method rendimiento(cantidad) {
        return 1 + bebidaBase.rendimiento(cantidad / 4)
    }
}

class Coctel {
    const componentes = []

    method agregarBebida(bebida) {
        componentes.add(bebida)
    }

    method rendimiento(cantidad) {
        if (componentes.isEmpty()) 
            return 0

        const cantidadPorBebida = cantidad / componentes.size()

        return componentes.fold(1, { acum, bebida =>
            acum * bebida.rendimiento(cantidadPorBebida)
        })
    }
}